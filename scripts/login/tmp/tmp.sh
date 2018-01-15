#!/usr/bin/expect -f

set ip [lindex $argv 0];
set username [lindex $argv 1];
set passwd [lindex $argv 2];
set cmd [lindex $argv 3]

set count 1
puts "----------count < 2"
if {$count < 2} {
	puts "----------count < 2"
}
