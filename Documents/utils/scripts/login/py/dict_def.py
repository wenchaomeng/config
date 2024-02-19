import sys, getopt
import json
import os 


dir_path = os.path.dirname(os.path.realpath(__file__))
powerop=2

def load_dict(file):
    with open(file,'r') as load_f:
        load_dict = json.load(load_f)
        return load_dict

dict_data=load_dict(dir_path + "/../dict.config")

def getIpAndAccount(parts):
    length = len(parts)
    app = "kc"
    if length >= 1:
        app = parts[0]

    dc = dict_data[app].keys()[0]
    if length >= 2:
        dc = parts[1]

    server = 1
    if length >=3:
        if len(parts[2]) < 6:
            server = int(parts[2])
	
    return (dict_data[app][dc][server - 1], powerop) 


def getAll(data):
    if type(data) == str:
        return [data];
    if type(data) == list:
        return data;
    if type(data) is dict:
        result = []
        for k in data:
            result += getAll(data[k])
        return result
    return []


def getIps(parts):
    length = len(parts)
    if length == 1 :
        return getAll(dict_data[parts[0]])
    if length == 2:
        return getAll(dict_data[parts[0]][parts[1]])
    if length == 3:
        return getAll(dict_data[parts[0]][parts[1]][parts[2]])

    return [];


def main(argv):
    if len(argv) > 1:
        if argv[1] == "ips":
            ips = getIps(argv[2:])
            for i in ips:
                print i,
            return
    (ip, account) = getIpAndAccount(argv[1:])
    print ip, account

if __name__ == "__main__":
    main(sys.argv)

