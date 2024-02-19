keepers_fat=""
keepers_uat=""
meta_uat=""
user=xpipe
password=$test_pass
log=/tmp/log

function checkAll(){
	hosts=$1
	cmd=$2
	for host in $hosts
	do
		./expect_jump.sh $host $user $password "$cmd" $log > tmp.log 2>&1
	done
	echo "------------------------------------------------------------------finished------------------------------------------------------------------------------------------------" >> $log
}
function taillog(){
	log=$1
	while :
	do
			sleep 1
			if [ -f $log ];
			then
					break
			fi
			echo file $log not exist
	done
	echo tail $log
	tail -f $log
}

rm -rf $log


#hosts=$keepers_fat
hosts=$keepers_uat
hosts=$meta_uat
#hosts=$meta_uat
#hosts="10.2.54.223"
#checkAll "$hosts" "egrep \"\[11:[23].*(FULL|doFull|setRedisKeeperServerState)\" /opt/logs/100004376/keepercontainer.log"
#checkAll "$hosts" "egrep \"\[17:.*(FULL|doFull)\" /opt/logs/100004376/keepercontainer.log" &
#checkAll "$hosts" "egrep \"15:17:15\" /opt/logs/100004375/metaserver.log"
#checkAll "$hosts" "df -h"
checkAll "$hosts" "egrep \"Tomcat\" /opt/logs/100004375/metaserver.log"

taillog $log
