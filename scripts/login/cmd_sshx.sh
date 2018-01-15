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

function executeOnHosts(){
	currentHosts=$1
	currentCmd=$2

	code=`python $codeScript`
	realpass="$rawpass $code"
	
	echo ----------------------------------$currentHost-----------------------------------------------------------
	echo $realpass
	$path/expect_jump_cmd.sh  $jump $user "$realpass"  "$currentHosts" $powerop "$currentCmd" "$log"
}

#hosts=$keepers
hosts="10.28.61.124 10.28.61.125"
#executeOnHosts "$hosts" "df -h"
executeOnHosts "$hosts" "egrep \"12:14:40:6\" /opt/logs/100004376/keepercontainer.log"
