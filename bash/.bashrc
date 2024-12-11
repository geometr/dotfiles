#!/bin/bash

# Color definition for the prompt
blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

# if not running interactively? don't do anything
case $- in 
    *i*) ;;
      *) return;;
esac

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremly rare, and such
        # a case wold tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ -f /usr/share/git/git-prompt.sh ]; then
  . /usr/share/git/git-prompt.sh 
fi

TIMER_START=0

last_command_time(){
  if [[ "$TIMER_START" -ne 0 ]]; then
    local TIMER_END=$(date +%s%3N)
    local DURATION=$((TIMER_END - TIMER_START))

    if [[ "$DURATION" -lt 0 ]]; then
      DURATION=0
    fi

    if [ "$DURATION" -ge 1000 ]; then
      echo -e "\033[33m Command took $(bc <<< "scale=2; $DURATION/1000") seconds \033[0m"
    else
      echo -e "\033[33m Command took ${DURATION}ms \033[0m"
    fi
  fi
 TIMER_START=$(date +%s%3N)
}


if [[ ! "$PROMPT_COMMAND" =~ last_command_time ]]; then
  PROMPT_COMMAND="last_command_time; $PROMPT_COMMAND" 
fi

if [ "$color_prompt" = "yes" ]; then
  PS1="${debian_chroot:+($debian_chroot)}$grn\u@\h$clr:$blu\w$ylw\$(__git_ps1 ' (%s)')$clr\$ "
else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\W\$ "
fi

unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

set -o vi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_local ]; then
. ~/.bash_aliases_local
fi

# Extract files from any archive
# Usage: ex <archive_name>
extract () {
if [ -f "$1" ] ; then
case $1 in
*.tar.bz2) tar xjf "$1" ;;
*.tar.gz) tar xzf "$1" ;;
*.bz2) bunzip2 "$1" ;;
*.rar) rar x "$1" ;;
*.gz) gunzip "$1" ;;
*.tar) tar xf "$1" ;;
*.tbz2) tar xjf "$1" ;;
*.tgz) tar xzf "$1" ;;
*.zip) unzip "$1" ;;
*.Z) uncompress "$1" ;;
*.7z) 7z x "$1" ;;
*) echo "Unsupported archive format: '$1'" ;;
esac
else
echo "File not found: '$1'"
fi
}
alias ex='extract'

export HISTTIMEFORMAT="%F %T "
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTIGNORE="&:ls:[bf]g:exit"
shopt -s histappend
if [[ ! "$PROMPT_COMMAND" =~ "history -a" ]]; then
  PROMPT_COMMAND="$PROMPT_COMMAND history -a;"
fi
if [[ ! "$PROMPT_COMMAND" =~ "history -n" ]]; then
  PROMPT_COMMAND="$PROMPT_COMMAND history -n;"
fi

shopt -s checkwinsize
shopt -s cdspell

#prevent core dumps
ulimit -c 0

export EDITOR=nvim
export VISUAL=nvim
export MESA_GL_VERSION_OVERRIDE=4.5

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$HOME/.local/bin:$PNP_HOME:$PATH"

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

if [ -f /usr/share/bash-completion/bash_completion ]; then
  .  /usr/share/bash-completion/bash_completion
fi

