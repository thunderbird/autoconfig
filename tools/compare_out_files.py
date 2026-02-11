# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

import argparse
import difflib
import json
import os.path
import sys
import requests
from typing import Dict, List

GENERATED_FILES_NAME = "generated_files.json"


def get_and_compare(file_name: str, base_url: str, local_folder: str) -> str:
    """Reads a local file and compare it with its remote copy before returning
    its content.

    Returns:
        The file's content as served by the remote server, decoded as UTF-8
        text.

    Raises:
        RuntimeError if the local file's content doesn't match the remote copy.
    """
    resp = requests.get(f"{base_url}/{file_name}")

    # The response might not include an content-type header, and there are some
    # non-ASCII characters in our XML files (e.g. in display names), so we need
    # to explicitly tell `resp` what its encoding is.
    resp.encoding = "utf-8"

    with open(os.path.join(local_folder, file_name), "r") as fp:
        local_list = fp.readlines()

        deltas = list(
            difflib.unified_diff(
                local_list,
                resp.text.splitlines(keepends=True),
                fromfile="local",
                tofile="remote",
            )
        )

        if len(deltas):
            print(f"Diff deltas:\n\n{"".join(deltas)}", file=sys.stderr)
            raise RuntimeError("local file list does not match staging copy")

        return resp.text


def get_file_list(base_url: str, local_folder: str) -> List[str]:
    """Gets the list of files to compare.

    Returns:
        The list of file names as per the `generated_files.json` file.

    Raises:
        RuntimeError if the local `generated_files.json` file does not match the
        remote copy.
    """
    file_list = get_and_compare(GENERATED_FILES_NAME, base_url, local_folder)
    return json.loads(file_list)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-b", metavar="base_url", help="base URL serving ISPDB files")
    parser.add_argument(
        "folder", help="the folder containing the local ISPDB files to compare"
    )

    args = parser.parse_args()

    # Strip out any trailing slash in the base URL so we don't accidentally end
    # up doubling it.
    base_url: str = args.b.strip("/")

    print("Fetching and comparing file list")

    listed_files = get_file_list(base_url, args.folder)

    failed_files: Dict[str, Exception] = {}
    for file in listed_files:
        print(f"Fetching and comparing {file}")

        try:
            get_and_compare(file, base_url, args.folder)
        except Exception as e:
            print(f"Comparison failed for file {file}: {e}", file=sys.stderr)
            failed_files[file] = e

    if len(failed_files) > 0:
        # Print the failed files, preceded by an empty line to separate them
        # from the previous logs.
        print("\nComparing the following file(s) has failed:", file=sys.stderr)

        for file, exc in failed_files.items():
            print(f"{file}: {exc}", file=sys.stderr)

    # Check if we can find files that exist in the local directory but isn't
    # listed in `generated_files.json`. We could also do this check in the other
    # direction (i.e. check if a file in `generated_files.json` is missing from
    # the local directory), but if a file from the list is missing then trying
    # to open it earlier will have raised an exception and will already cause
    # the script to fail.
    local_files = os.listdir(args.folder)

    # Make sure we don't try to find the JSON list file in itself.
    local_files.remove(GENERATED_FILES_NAME)

    unknown_files = []
    for local_file in local_files:
        if local_file not in listed_files:
            unknown_files.append(local_file)

    if len(unknown_files) > 0:
        print("\nUnknown file(s) in local directory:", file=sys.stderr)

        for file in unknown_files:
            print(file, file=sys.stderr)
    else:
        print("No unknown files found")

    # Fail the script if either a comparison has failed or we found an unknown
    # file. We could fail earlier, but it's more helpful for troubleshooting if
    # we have the script point out as many issues in one run as possible.
    if len(failed_files) > 0 or len(unknown_files) > 0:
        sys.exit(1)


if __name__ == "__main__":
    main()
