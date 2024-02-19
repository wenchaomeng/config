import os
import base64
import time
import hmac
import hashlib
import struct
import string

env_dist = os.environ
googleCode=env_dist["ctrip_googleCode"]

def GoogleAuthenticatorCode(secret):
    key = base64.b32decode(secret, True)
    message = struct.pack(">Q", time.time() / 30)
    hashcode = hmac.new(key, message, hashlib.sha1).digest()
    offset = ord(hashcode[19]) & 15
    raw = (struct.unpack(">I", hashcode[offset:offset+4])[0] & 0x7fffffff) % 1000000
    return  "%06d" % raw

print GoogleAuthenticatorCode(googleCode)
