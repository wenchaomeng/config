hosts_fat=""
hosts_uat=""
user=xpipe
password=$test_pass
log=/tmp/log

function checkAll(){
	hosts=$1
	for host in $hosts
	do
		./expect_jump.sh $host $user $password "cat /opt/settings/server.properties" $log > tmp.log 2>&1
	done
}

rm -rf $log

checkAll "$hosts_fat"
#checkAll "$hosts_uat"

cat $log

