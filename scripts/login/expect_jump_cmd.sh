#!/usr/bin/expect -f

set jump [lindex $argv 0];
set username [lindex $argv 1];
set passwd [lindex $argv 2];
set realserverips  [lindex $argv 3];
set role  [lindex $argv 4];
set cmd  [lindex $argv 5]
set log_file [lindex $argv 6]

if { $log_file == "" } {
	set log_file "/tmp/log"
} 

set file [ open $log_file w ]

proc log {msg} {
    global file
    puts $file $msg
    flush $file
}

spawn ssh $username@$jump
expect {
	"assword:" { send "$passwd\r" }
}

foreach item $realserverips {
		log "--------------------------------$item----------------------------------------"
		expect {
		"server keyword" { send "$item\r" }
		}

		expect {
		"Select account" { send "$role\r" }
		}

		if { $cmd == "" } {
			interact
		} else {

			set timeout 60
			append cmd "\r"
			expect {
				"~]\\$" { sleep 0.1; send $cmd }
			}
			expect {
				"~]\\$" { log  "$expect_out(buffer)";send "exit\r"}
			}
			expect {
				"to last session or q to exit" { send "\r" }
			}
		}
}
exit

