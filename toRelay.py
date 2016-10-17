# $language = "python"
# $interface = "1.0"

# This automatically generated script may need to be
# edited in order to work correctly.

import base64
import time
import hmac
import hashlib
import struct
import string



googleCode="xxxxx"
password="xxxxx"

def GoogleAuthenticatorCode(secret):
    key = base64.b32decode(secret, True)
    message = struct.pack(">Q", time.time() / 30)
    hashcode = hmac.new(key, message, hashlib.sha1).digest()
    offset = ord(hashcode[19]) & 15
    raw = (struct.unpack(">I", hashcode[offset:offset+4])[0] & 0x7fffffff) % 1000000
    return  "%06d" % raw


def Main_():
	code = str(GoogleAuthenticatorCode(googleCode))
		
	screen = crt.GetScriptTab().Screen
	screen.Synchronous = True
	needV = screen.WaitForString("Verification code: ", 1)
	if needV == 1:
		screen.Send(code + chr(13))
		screen.WaitForString("Password: ", 1)
		screen.Send(password + chr(13))
	screen.Synchronous = False

def Main():
	code = str(GoogleAuthenticatorCode(googleCode))
	screen = crt.GetScriptTab().Screen
	screen.Synchronous = True
	if screen.WaitForString("Password:", 1):
	    screen.Send(password + code + chr(13))
    
Main()

