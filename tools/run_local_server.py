#!/usr/bin/env python3

"""
This script serves as a simple test server for the ISPDB.

NOTE: This should *not* be used as a production server. It lacks any security
considerations and could compromise the hosting system if hosted publicly. This
script is intended for deploying ISPDB for local testing only.

The benefit of using this script over serving the directory with the built-in
`http.server` module is that this script sets the response `Content-Type` header
appropriately.

To run this script, execute the following commands:

```
$ cd /path/to/autoconfig # assumed to be the location where this repository is checked out.
$ mkdir local_mirror
$ python tools/convert.py -a -d local_mirror ispdb/* # Process the input files to the directory to serve.
$ cd local_mirror
$ python ../tools/run_local_server.py
```
The local ISPDB instance will be available on `http://localhost:8000/`
"""

from http.server import BaseHTTPRequestHandler, HTTPServer
import os

class XMLServerHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        # Get the requested path and strip the leading '/'
        path = self.path[1:]

        if os.path.isfile(path):
            # Set the Content-Type header to send with the file.
            self.send_response(200)
            self.send_header('Content-Type', "application/xml")
            self.end_headers()
            with open(path, 'rb') as file:
                self.wfile.write(file.read())
        else:
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b"File not found")

def run_server(server_class=HTTPServer, handler_class=XMLServerHandler):
    server_address = ('', 8000)
    httpd = server_class(server_address, handler_class)
    print('Server running on port 8000...')
    httpd.serve_forever()

if __name__ == "__main__":
    run_server()

