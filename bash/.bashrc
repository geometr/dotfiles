#!/bin/bash
set -o vi
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_local ]; then
. ~/.bash_aliases_local
fi

# Extract files from any archive
# Usage: ex <archive_name>
ex () {
if [ -f $1 ] ; then
case $1 in
*.tar.bz2) tar xjf $1 ;;
*.tar.gz) tar xzf $1 ;;
*.bz2) bunzip2 $1 ;;
*.rar) rar x $1 ;;
*.gz) gunzip $1 ;;
*.tar) tar xf $1 ;;
*.tbz2) tar xjf $1 ;;
*.tgz) tar xzf $1 ;;
*.zip) unzip $1 ;;
*.Z) uncompress $1 ;;
*.7z) 7z x $1 ;;
*) echo "'$1' cannot be extracted via extract()" ;;
esac
else
echo "'$1' is not a valid file"
fi
}

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

export HISTTIMEFORMAT="%F %T "
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTIGNORE="&:ls:[bf]g:exit"

shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell

#prevent core dumps
ulimit -c 0

export MESA_GL_VERSION_OVERRIDE=4.5
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export EDITOR=nvim;
export VISUAL=nvim;
export PNPM_HOME="/home/sinclair/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.local/bin:$PATH"
