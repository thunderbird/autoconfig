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
import lxml.etree as ET


def read_config(file, convertTime):
    return (ET.parse(file), max(os.stat(file).st_mtime, convertTime))


def print_config(doc):
    print doc.toxml(encoding="UTF-8")


def write_config(outData, time, filename=None):
    if os.path.exists(filename) and os.stat(filename).st_mtime >= time:
        return
    print "Writing %s" % filename
    file = codecs.open(filename, "w")
    file.write(outData)
    file.close()


def write_domains(doc, time, output_dir="."):
    outData = ET.tostring(doc.getroot(), encoding="UTF-8") + "\n"
    for d in doc.findall("//domain"):
        write_config(outData, time, output_dir + "/" + d.text)


def convert_11_to_10(doc):
    # Mark that we're writing a 1.0 client config.
    doc.getroot().attrib["version"] = "1.0"

    # Change <authentication>password-cleartext</> to plain and
    # <authentication>password-encrypted</> to secure (from bug 525238).
    for a in doc.findall("//authentication"):
        if "password-cleartext" in a.text:
            a.text = "plain"
        if "password-encrypted" in a.text:
            a.text = "secure"

    # Remove all but the first of the incoming and outgoing servers.
    def removeRest(parent, tagname):
        first = True
        for a in parent.findall(tagname):
            if first:
                first = False
            else:
                parent.remove(a)
    parent = doc.find("//emailProvider")
    removeRest(parent, "incomingServer")
    removeRest(parent, "outgoingServer")
    outgoingServer = parent.find("outgoingServer")
    for a in outgoingServer.findall("restriction"):
        outgoingServer.remove(a)
    for a in parent.findall("documentation"):
        parent.remove(a)


def main():
    # parse command line options
    parser = argparse.ArgumentParser()
    parser.add_argument("-v", choices=["1.0"],
                        help="convert input files to version 1.0")
    parser.add_argument("-d", metavar="dir",
                        help="output directory")
    parser.add_argument("-a", action="store_true",
                        help="write configuration files for all domains")
    parser.add_argument("file", nargs="*",
                        help="input file(s) to process, wildcards allowed")
    args = parser.parse_args(sys.argv[1:])

    # process arguments
    convertTime = os.stat(sys.argv[0]).st_mtime
    is_dir = stat.S_ISDIR

    for f in args.file:
        if is_dir(os.stat(f).st_mode):
            continue

        if f == "README":
            continue

        doc, time = read_config(f, convertTime)

        if args.v == "1.0":
            convert_11_to_10(doc)

        if args.a:
            if args.d:
                write_domains(doc, time, args.d)
            else:
                print "When you want to write domain files you",
                print "should also specify an output directory",
                print "using -d dir"
                parser.print_usage()
                exit(2)
        elif args.d:
            write_config(doc, time, args.d + "/" + os.path.basename(f))
        else:
            print_config(doc)


if __name__ == "__main__":
    main()
