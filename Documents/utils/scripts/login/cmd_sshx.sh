#!/bin/bash
function getCurrentRealPath(){
    source="${BASH_SOURCE[0]}"
    while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
      dir="$( cd -P "$( dirname "$source" )" && pwd )"
      source="$(readlink "$source")"
      [[ $source != /* ]] && source="$dir/$source" # if $source was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    dir="$( cd -P "$( dirname "$source" )" && pwd )"
    echo $dir
}

path=`getCurrentRealPath`
log="./log"
. $path/common.sh $path

keepers="10.28.61.124 10.28.61.125"

function getRealPass(){
	code=`python $codeScript`
	realpass="$rawpass $code"
	echo $realpass

}

function executeOnHosts(){
	currentHosts=$1
	currentCmd=$2

	realpass=`getRealPass`
	echo ----------------------------------$currentHosts-----------------------------------------------------------
	$path/expect_jump_cmd.sh  $jump $user "$realpass"  "$currentHosts" $powerop "$currentCmd" "$log"
}

#keepers_rb=`python $dictScript ips kc rb`
#keepers_oy=`python $dictScript ips kc oy`
#keepers_rb_hotel=`python $dictScript ips kch rb`
#keepers_oy_hotel=`python $dictScript ips kch oy`
#keepers_rb_flight=`python $dictScript ips kcf rb`
#keepers_oy_flight=`python $dictScript ips kcf oy`
#meta_rb=`python $dictScript ips me oy`
#meta_oy=`python $dictScript ips me oy`

#hosts=$keepers_rb_hotel
#hosts=$keepers_oy_hotel 
#hosts=$meta_rb
#hosts=$meta_oy
hosts="
"
#executeOnHosts "$hosts" "sudo /opt/MegaRAID/storcli/storcli64 /c0 show events | egrep -i -B 11  \"error\"  | egrep -i \"time|error\""
#executeOnHosts "$hosts" "sudo fio -group_reporting -filename=/opt/data/test_block -direct=1 -iodepth=1 -thread -rw=write -ioengine=sync -bs=512k -size=2G -obs=10 -runtime=30 -name=test_write --output=fio.log"
#executeOnHosts "$hosts" "sudo /opt/MegaRAID/storcli/storcli64  /call/eall/sall show all | egrep \"Write Cache|Drive.*s[0-9] :|Raw size\""
#executeOnHosts "$hosts" "sudo yum install fio -y"
#executeOnHosts "$hosts" "fio -v"
executeOnHosts "$hosts" "lspci | egrep -i raid"
#executeOnHosts "$hosts" "egrep \"\\[1[56].*(doFull|FULLRE)\" /opt/logs/100004376/keepercontainer.log"
#executeOnHosts "$hosts" "egrep \"cloned object data\" /opt/logs/100004375/metaserver.log"
