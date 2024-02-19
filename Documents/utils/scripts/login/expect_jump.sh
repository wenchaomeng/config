#!/usr/bin/expect -f

set jump [lindex $argv 0];
set username [lindex $argv 1];
set passwd [lindex $argv 2];
set realserverip  [lindex $argv 3];
set role  [lindex $argv 4];
set cmd  [lindex $argv 5]

spawn ssh -o StrictHostKeyChecking=no  $username@$jump
expect {
"assword:" { sleep 0.8; send "$passwd\r" }
}


#expect {
#"请选择目标资产" { send "$realserverip\r" }
#}

#expect {
#"选择登录帐号" { send "$role\r" }
#}

expect {
	"Opt" { send "$realserverip\r"}
}
expect {
	"ID" { send "2\r" }

}

if { $cmd == "" } {
	interact {
		timeout 60 { send " \177" }
	}
} else {

	puts "send command....."
	append cmd "\r"

	expect {
		"~]\\$" { sleep 0.8; send $cmd }
	}
	expect {
		"~]\\$" {}
	}
}
exit

