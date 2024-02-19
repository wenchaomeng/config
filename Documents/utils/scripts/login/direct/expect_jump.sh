#!/usr/bin/expect -f

set host [lindex $argv 0];
set username [lindex $argv 1];
set passwd [lindex $argv 2];
set cmd  [lindex $argv 3]
set log_file [lindex $argv 4]


if { $log_file == "" } {
    set log_file "/tmp/log"
}

set file [ open $log_file a ]

proc log {msg} {
    global file
    puts $file $msg
    flush $file
}

spawn ssh $username@$host
expect {
"yes/no" { send "yes\r"; exp_continue}
"assword:" { sleep 0.1; send "$passwd\r" }
}

if { $cmd == "" } {
	interact
} else {

    log "--------------------------------$host---------------------------------------"

	puts "send command....."
	append cmd "\r"

	expect {
		"~]\\$" { sleep 0.1; send $cmd }
	}
	expect {
		"~]\\$" { log  "$expect_out(buffer)";send "exit\r"}
	}
}
exit

