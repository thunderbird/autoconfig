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
import codecs
import os.path
import stat
import sys
from typing import Dict
import lxml.etree as ET


def read_config(file, convertTime):
    return (ET.parse(file), max(os.stat(file).st_mtime, convertTime))


def doc_to_bytestring(doc):
    return ET.tostring(doc.getroot(), encoding="UTF-8")


def print_config(doc):
    print(ET.tostring(doc.getroot(), encoding="unicode"))


def write_config(outData, time, filename=None):
    if os.path.exists(filename) and os.stat(filename).st_mtime >= time:
        return
    print("Writing %s" % filename)
    file = codecs.open(filename, "wb")
    file.write(outData)
    file.write(b"\n")
    file.close()


def write_domains(doc, time, output_dir="."):
    outData = doc_to_bytestring(doc)
    for d in doc.getroot().findall(".//domain"):
        write_config(outData, time, output_dir + "/" + d.text)


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
    args = parser.parse_args(sys.argv[1:])

    # process arguments
    convertTime = os.stat(sys.argv[0]).st_mtime
    is_dir = stat.S_ISDIR

    # Record the files that failed to be processed and the errors related to
    # them.
    failed_files: Dict[str, Exception] = {}

    for f in args.file:
        try:
            if is_dir(os.stat(f).st_mode):
                continue

            if f == "README":
                continue

            print(f"Processing {f}")

            doc, time = read_config(f, convertTime)

            if args.a:
                if args.d:
                    write_domains(doc, time, args.d)
                else:
                    print("When you want to write domain files you")
                    print("should also specify an output directory")
                    print("using -d dir")
                    parser.print_usage()
                    exit(2)
            elif args.d:
                outData = doc_to_bytestring(doc)
                write_config(outData, time, args.d + "/" + os.path.basename(f))
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

        exit(1)


if __name__ == "__main__":
    main()
