#!/usr/bin/env python

import sys
import json
import struct
import os

def getMessage():
    rawLength = sys.stdin.read(4)
    if len(rawLength) == 0:
        sys.exit(0)
    messageLength = struct.unpack('@I', rawLength)[0]
    message = sys.stdin.read(messageLength)
    return json.loads(message)


while True:
    receivedMessage = getMessage()
    if receivedMessage == "kill":
        os.system("shutdown now -h")
