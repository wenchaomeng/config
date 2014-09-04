#enables colorin the terminal bash shell export
export CLICOLOR=1
#sets up thecolor scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#sets up theprompt color (currently a green similar to linux terminal)
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
#enables colorfor iTerm
export TERM=xterm-color

NGINX_HOME=/usr/local/nginx
alias ns='sudo $NGINX_HOME/sbin/nginx'
#alias nk="ps -ef | grep 'master proces[s]' | awk '{print \$2}' | xargs kill -QUIT "
alias nk="ps -ef | grep '[n]ginx' | awk '{print \$2}' | xargs sudo  kill -9 ; rm -rf $NGINX_HOME/logs/* "
alias nr='nk;ns;'
alias nc='cd $NGINX_HOME/conf'
alias n='cd $NGINX_HOME/sbin'
alias nl='cd $NGINX_HOME/logs/'
alias psn='ps -ef | grep ngin[x]'
#gdb nginx core
alias gnc='sudo gdb /usr/local/nginx/sbin/nginx -c '
#remove core files
alias rmc='rm -rf /cores/*'

#c develop
alias c='cd ~/Documents/dp/cpp'
alias d='cd ~/Documents/dp/Dengine'
alias t='cd ~/Documents/dp/Dengine/tengine'

#java
alias dp='cd ~/Documents/dp'
alias slb='cd ~/Documents/dp/phoenix-slb-admin'
alias agent='cd ~/Documents/dp/phoenix/phoenix-agent'


#maven
alias mt='mvn -Dmaven.test.skip=true'
alias mr='mvn -Dmaven.test.skip=true jetty:run'

NODE_HOME=/Users/mengwenchao/Downloads/develop/node-v0.10.29-darwin-x64
export PATH=/Users/mengwenchao/.local/stow/gdb-1822/bin:$PATH:$NODE_HOME/bin

#add private key
dp;ssh-add  $GIT_COMPANY $GIT_GITHUB;
