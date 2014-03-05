#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/Applications/Adobe\ Flash\ Builder\ 4.7/eclipse/plugins/com.adobe.flash.compiler_4.7.0.349722/AIRSDK/bin/
#export PATH=$PATH:/opt/local/lib/ruby/gems/1.8/gems/fcgi-0.8.7/lib

export CLICOLOR=1
#export LSCOLORS=Fxbxaxdxcxegedabagacad
#export PS1="[\@] \u@\w > "
#export PS1="\[\e[32;1m\]\u@\H \w \$ \[\e[0m\]"
#PS1="[\u@\h \W]\$ "
#\h:\W \u\$
 
#export PS1='\[\033[01;33m\]\u@\h\[\033[01;31m\] \W\$\[\033[00m\] '
export PS1='\[\033[0;32m\][$(date +%a*%H:%m)] \[\033[01;33m\]\u@\[\033[01;31m\] \W\$\[\033[00m\] > '
#export PS1='\[\033[0;32m\][\A] \[\033[01;33m\]\u@\[\033[01;31m\] \W\$\[\033[00m\] > '
#export RSENSE_HOME='~/local/rsense'
export TERM='linux'
#export BUNDLE_GEMFILE=/Users/poplax/Gemfile
# grep
alias grep='grep --color=always'
alias ls='ls -G'
alias ll='ls -Galh'
alias c='clear'
alias em='emacs'
#source ~/.profile
