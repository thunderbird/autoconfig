# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# This script checks all input files to validate that their content is valid
# XML. It is meant to run in the CI for PRs against the autoconfig repository.

import argparse
import os
import sys
from typing import List

from lxml import etree


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "file", nargs="*", help="input file(s) to process, wildcards allowed"
    )
    args = parser.parse_args()

    # Defining `files` here isn't strictly necessary, but the extra typing
    # (which we can't really get otherwise) helps with maintenance.
    files: List[str] = args.file

    # The exit code. Stays 0 unless we encounter a file that doesn't parse.
    ret = 0

    for f in files:
        # Filter out directories an non-XML files
        if os.path.isdir(f):
            print(f"Ignoring directory {f}")
            continue

        if not f.endswith(".xml"):
            print(f"Ignoring non-XML file {f}")
            continue

        # Try parsing the file. If this did not work, print the error and set
        # the exit code to 1.
        try:
            etree.parse(f)
        except Exception as e:
            print(f"File {f} did not parse: {e}")
            ret = 1

    sys.exit(ret)


if __name__ == "__main__":
    main()
