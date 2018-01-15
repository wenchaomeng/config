import sys, getopt
import json
import os 


powerop=3

def load_dict(file):
    with open(file,'r') as load_f:
        load_dict = json.load(load_f)
        return load_dict

def getIpAndAccount(parts):
	length = len(parts)

	app = "kc"
	if length >= 1:
		app = parts[0]

	dc = dict[app].keys()[0]
	if length >= 2:
		dc = parts[1]

	server = 1
	if length >=3:
		server = int(parts[2])
	
	return (dict[app][dc][server - 1], powerop) 

def getIps(parts):
    print "empty"
    


def main(argv):
	(ip, account) = getIpAndAccount(argv)
	print ip, account


if __name__ == "__main__":
    dir_path = os.path.dirname(os.path.realpath(__file__))
    dict=load_dict(dir_path + "/../dict.config")
    if sys.argv[1] == "ips":
        getIps(sys.argv[2:])
    else:
        main(sys.argv[1:])
