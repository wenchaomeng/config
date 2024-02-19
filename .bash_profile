#enables colorin the terminal bash shell export
CLICOLOR=1
#sets up thecolor scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#sets up theprompt color (currently a green similar to linux terminal)
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
#enables colorfor iTerm
export TERM=xterm-color
export BASH_SILENCE_DEPRECATION_WARNING=1



set -o vi
alias ls='ls -G'

#self
alias blog='cd ~/Documents/self/mengwenchao.github.io'
alias tt='vi ~/TODO'
alias j='vi ~/Documents/files/japan/list'


#test
alias t='cd ~/Documents/ctrp/java_test'
alias td='cd ~/Documents/ctrp/linux-tools/container'

function sshf(){
	ip=$1
	port=$2
	user=$3
	pass=$4
	~/.expect $@
}

#machine
ip=` 'ifconfig' | egrep "10\.|192\." | awk '{print $2;exit}'  `
alias sshv='expect -c '\''spawn  ssh wenchao@'"$ip"' -p 2222; expect "password";  send "123456\r"; interact'\'
alias sshl='sshf $ip 22 wenchao 123456'		   #local
alias sshw='sshf dst018049 22 wenchao 123456'  #windows

# mysql 

export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
alias myl='expect -c '\''spawn  mysql -uroot -h 127.0.0.1 -P3306 -Dtest -p ;  expect "password";  send "root\r"; interact'\'
alias myd='cd ~/Documents/db/mysql'
alias 3306='cd ~/Documents/db/mysql/localmysql/3306'
alias mydk='cd ~/Documents/db/mysql/docker-mysql-replication'
alias mys='cd ~/Documents/opensource/mysql-server'
alias psm='ps -ef | egrep mysql[d]'


#rocksdb
export PATH=$PATH:/Users/mengwenchao/Documents/opensource/rocksdb/build
alias  rocks='cd ~/Documents/opensource/rocksdb'

#gradle
GRADLE_HOME=/Users/mengwenchao/Documents/program/gradle-5.4.1
export PATH=$PATH:$GRADLE_HOME/bin

#java
#export JAVA_HOME=`/usr/libexec/java_home -v 11` 
#export JAVA_HOME=`/usr/libexec/java_home -v 17` 
export JAVA_HOME=`/usr/libexec/java_home -v 1.8` 
#export JAVA_HOME='/opt/homebrew/Cellar/openjdk/20.0.1'
export PATH=$JAVA_HOME/bin:$PATH

#eclipse
export es='/Applications/Eclipse.app/Contents/MacOS/eclipse > ~/tmp/eclipse.log &'

#ctrip
alias lg='cd ~/Documents/utils/scripts/login'
export PATH=$PATH:~//Documents/utils/scripts/login
alias ctp='cd ~/Documents/ctrp'

#eclipse
alias ec='/Applications/Eclipse.app/Contents/MacOS/eclipse > ~/tmp/eclipse.log &'


#maven
alias mt='mvn -Dmaven.test.skip=true'


#gdb
export PATH=~/.local/stow/gdb-1822/bin:$PATH

#xpipe
alias xp='cd ~/Documents/ctrp/x-pipe'

#drc
alias drc='cd ~/Documents/ctrp/drc'

#redis
alias r='cd ~/Documents/ctrp/redis'
alias xr='cd ~/Documents/ctrp/xredis'
alias rc='cd ~/Documents/db/redisconf'
alias psr='ps -ef | grep redis-serve[r]'
alias sshxr='sshx 10.9.138.8'

#pika
alias pika='cd ~/Documents/opensource/pika'


#dal
alias dal='cd ~/Documents/ctrp/dal'
alias gdal='cd ~/Documents/ctrp/dal_github'

#oceanbase
alias ob='cd ~/Documents/opensource/oceanbase'

#voltdb
export PATH=/Users/mengwenchao/Documents/opensource/voltdb/bin:$PATH
alias volt='cd ~/Documents/db/voltdb'

#ruby
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#rvm use 2.4.2
#
#go
export GOPROXY=https://mirrors.aliyun.com/goproxy

#shadowsocks
#start
alias sss='ss-local -s 18.119.57.203  -p 5349 -l 1086 -k wenchao85  -m  aes-256-cfb --no-delay > ~/tmp/ss-local.log 2>&1 &'

#rust
#sh /Users/mengwenchao/.cargo/env
alias rshl='cd ~/Documents/ctrp/hello-rust'

#tikv
alias tw='cd ~/Documents/ctrp/tikv'
alias tl='cd ~/Documents/db/tikv/local'
alias pst='ps -ef | egrep  '\''tikv-server|pd-server'\'
alias kvc='cd ~/Documents/ctrp/tikv-client-java'
export PATH=/Users/mengwenchao/Documents/db/tikv/bin:$PATH

# learn
alias l='cd ~/Documents/ctrp/learn'
alias lg='cd ~/Documents/ctrp/learn/go'

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH


#
export CPATH=/opt/homebrew/include:$CPATH
export LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH

#clang
CLANG_HOME=/Users/mengwenchao/Downloads/tools/clang+llvm-15.0.3-arm64-apple-darwin21.0
export PATH=$CLANG_HOME/bin:$PATH
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
eval "$(/opt/homebrew/bin/brew shellenv)"

#ctest
alias ct='cd ~/Documents/ctrp/ctest'

#terraform
alias trf="cd ~/Documents/ctrp/linux-tools/terraform"


#k8
alias k8='cd ~/Documents/ctrp/k8s'


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH=/Users/mengwenchao/.tiup/bin:$PATH
. "$HOME/.cargo/env"
