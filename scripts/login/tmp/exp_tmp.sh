#!/usr/bin/expect -f
set ips [lindex $argv 0];
set user [lindex $argv 1];


set file [ open /tmp/log w]
proc log {msg} {
	global file
	puts $file $msg
	flush $file
}
log "----"

spawn sh ./cmd.sh

expect {
"Hello" { send " I am Tommy \r"; log "$expect_out(0,string)";}
}
expect {
		"questions" { send "Ok\r" }
}
expect {
	"topic" { sleep 1; send "Math\r"; sleep 1; }
}
sleep 2
