#!/usr/bin/expect -f

set ip [lindex $argv 0];
set username [lindex $argv 1];
set passwd [lindex $argv 2];
set cmd [lindex $argv 3]

puts "-------------------------"
puts "-------------------------"
if { $cmd == ""  } {
	puts  [append  ip " cmd empty" "acb"]
	puts  $ip
} else {
	puts "cmd  not empty"
}

exit

spawn ssh $username@$ip
expect {
"assword:" { send "$passwd\r" }
}
expect {
"~]\\$"  { send "ssh xpipe@10.2.45.29\r" }
}
expect {
"assword:" { send "$passwd\r" }
}
expect {
"~]\\$"  { send "ifconfig | grep 10\r" }
}

interact
exit

