# $language = "python"
# $interface = "1.0"

# This automatically generated script may need to be
# edited in order to work correctly.
dict = {
    "kc" : {
        "jq" : []
        "oy" : []
        "account" : 2
     }
}


def openWindow(host, account = 2):
    scriptTab = crt.GetScriptTab()
    cloned = scriptTab.Clone();
    crt.Sleep(1500)
    cloned.Screen.Synchronous = True
    cloned.Screen.Send(host + chr(13))
    cloned.Screen.Send(str(account) + "\n")


def Main():

    # wait for toRelay.py to finish running
    crt.Sleep(500)
    suf = crt.Dialog.Prompt("A", "B", "kc")
    parts = suf.split()
    length = len(parts)

    app = "kc"
    if length >= 1:
        app = parts[0]

    dc = dict[app].keys()[0]
    if dc == "account":
        dc = dict[app].keys()[1]
    if length >= 2:
        dc = parts[1]

    server = 1
    if length >=3:
        server = int(parts[2])
    openWindow(dict[app][dc][server - 1], dict[app]["account"])
Main()

