#enables colorin the terminal bash shell export
CLICOLOR=1
#sets up thecolor scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#sets up theprompt color (currently a green similar to linux terminal)
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
#enables colorfor iTerm
export TERM=xterm-color


alias dp='cd ~/Documents/dp'
alias c='dp; cd cpp'
alias ls='ls -G'
alias d='dp; cd Dengine'
alias t='d;cd tengine'
alias m='cd /data/appdatas/phoenix/slb/git/phoenix-slb-model'
alias ml='cd /data/appdatas/phoenix/slb/git/phoenix-slb-model'


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

set -o vi

#slb
alias slb='cd ~/Documents/dp/phoenix-slb-admin'
alias slbm='cd /data/appdatas/phoenix/slb/git/phoenix-slb-model'

#maven
alias mt='mvn -Dmaven.test.skip=true'


#gdb
export PATH=~/.local/stow/gdb-1822/bin:$PATH
