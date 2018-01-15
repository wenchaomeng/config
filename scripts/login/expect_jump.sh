#!/usr/bin/expect -f

set jump [lindex $argv 0];
set username [lindex $argv 1];
set passwd [lindex $argv 2];
set realserverip  [lindex $argv 3];
set role  [lindex $argv 4];
set cmd  [lindex $argv 5]

spawn ssh $username@$jump
expect {
#"yes/no" { send "yes\r"; exp_continue}
"assword:" { sleep 0.1; send "$passwd\r" }
}

expect {
"server keyword" { send "$realserverip\r" }
}

expect {
"Select account" { send "$role\r" }
}

if { $cmd == "" } {
	interact
} else {

	puts "send command....."
	append cmd "\r"

	expect {
		"~]\\$" { sleep 0.1; send $cmd }
	}
	expect {
		"~]\\$" {}
	}
}
exit

