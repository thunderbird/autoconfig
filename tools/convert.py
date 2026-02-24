#! /usr/bin/env python

# ***** BEGIN LICENSE BLOCK *****
# Version: MPL 1.1
#
# The contents of this file are subject to the Mozilla Public License Version
# 1.1 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
# The Original Code is Thunderbird autoconfig conversion tool.
#
# The Initial Developer of the Original Code is
# Mogens Isager <m@isager.net>.
#
# Portions created by the Initial Developer are Copyright (C) 2010
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Blake Winton <bwinton@latte.ca>
#
# ***** END LICENSE BLOCK *****

import argparse
import os.path
import sys
from typing import Dict, List
import json

import lxml.etree as ET


def read_config(file, convertTime):
    return (ET.parse(file), max(os.path.getmtime(file), convertTime))


def doc_to_bytestring(doc):
    return ET.tostring(doc.getroot(), encoding="UTF-8")


def print_config(doc):
    print(ET.tostring(doc.getroot(), encoding="unicode"))


def write_config(outData, time, filename=None):
    if os.path.exists(filename) and os.path.getmtime(filename) >= time:
        return
    print(f"Writing {filename}")
    with open(filename, "wb") as file:
        file.write(outData)
        file.write(b"\n")


def write_domains(doc, time, output_dir=".") -> List[str]:
    outData = doc_to_bytestring(doc)

    domains: List[str] = []

    for d in doc.getroot().findall(".//domain"):
        write_config(outData, time, os.path.join(output_dir, d.text))
        domains.append(d.text)

    return domains


def main():
    # parse command line options
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", metavar="dir", help="output directory")
    parser.add_argument(
        "-a", action="store_true", help="write configuration files for all domains"
    )
    parser.add_argument(
        "file", nargs="*", help="input file(s) to process, wildcards allowed"
    )
    args = parser.parse_args()

    # process arguments
    convertTime = os.path.getmtime(sys.argv[0])

    # Record the files that failed to be processed and the errors related to
    # them.
    failed_files: Dict[str, Exception] = {}

    # Record the names of the files written so we can list them in a file later.
    out_file_names: List[str] = []

    for f in args.file:
        try:
            if os.path.isdir(f):
                continue

            if f == "README":
                continue

            print(f"Processing {f}")

            doc, time = read_config(f, convertTime)

            if args.a:
                if args.d:
                    domains = write_domains(doc, time, args.d)
                    out_file_names.extend(domains)
                else:
                    print("When you want to write domain files you")
                    print("should also specify an output directory")
                    print("using -d dir")
                    parser.print_usage()
                    sys.exit(2)
            elif args.d:
                outData = doc_to_bytestring(doc)
                filename = os.path.basename(f)
                write_config(outData, time, os.path.join(args.d, filename))
                out_file_names.append(filename)
            else:
                print_config(doc)
        except Exception as e:
            print(f"File {f} could not be processed: {e}")
            failed_files[f] = e

    if len(failed_files) > 0:
        # Print the failed files, preceded by an empty line to separate them
        # from the previous logs.
        print()
        print("Processing the following file(s) has failed:")

        for file, exc in failed_files.items():
            print(f"{file}: {exc}")

        sys.exit(1)

    # Sort the list for idempotency.
    out_file_names.sort()

    # Write the list of output files in a JSON file. This file will mostly be
    # used in CI processes. We generate it with indentation so that other CI
    # scripts can produce a more legible output.
    out_file_list_path = os.path.join(args.d, "generated_files.json")
    with open(out_file_list_path, "w") as fp:
        print(f"Writing list of {len(out_file_names)} files")
        fp.write(json.dumps(out_file_names, indent=2))


if __name__ == "__main__":
    main()
