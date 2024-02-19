#!/usr/bin/expect -f
set ip [lindex $argv 0];
set port [lindex $argv 1];
set user [lindex $argv 2];
set password [lindex $argv 3];
set cmd  [lindex $argv 4];





spawn ssh -o StrictHostKeyChecking=no $user@$ip  -p$port
#spawn ssh -t cannon@10.112.229.27  -p22

set timeout 1


expect {
 "continue" { send "yes\r" }
 "password" { send "$password\r" }
}

set timeout 5

if { $cmd != "" } {
	expect {
    	"~]\\$" { sleep 0.1; send "$cmd\r";interact }
	}
}
interact
set timeout 60
