#!/bin/bash

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_local ]; then
. ~/.bash_aliases_local
fi

export MESA_GL_VERSION_OVERRIDE=4.5
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export EDITOR=nvim;
export VISUAL=nvim;
export HISTCONTROL=ignoredups
export PNPM_HOME="/home/sinclair/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.local/bin:$PATH"
