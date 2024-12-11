# dotfiles

This repository contains my personal configuration files (dotfiles) for Linux environment.

## Features

Shell setup: Customized Bash shell with aliases, functions, and history management.

Neovim: A powerful text editor configured for development and file management.

Development tools: Support for Python, Node.js (via pyenv and nvm), and others.

## Installation

Clone the repository:

```
git clone https://github.com/geometr/dotfiles.git ~/dotfiles
```

Backup existing dotfiles:

```
mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_aliases ~/.bash_aliases.bak
mv ~/.bash_logout ~/.bash_logout.bak
mv ~/.bash_profile ~/.bash_profile.bak
```

Run install.sh script
```
install.sh
```
Install Neovim and other dependencies if needed:
```
sudo pacman -S neovim git ranger tmux
```
Source the configuration:
```
source ~/.bashrc
```
## Usage

### Bash

Aliases: Check ~/.bash_aliases for a list of predefined shortcuts.

Timer: Track command execution times automatically.

Prompt: Includes Git branch info and color-coded structure.

### Neovim

Launch Neovim with nvim.

Configuration is located in ~/.config/nvim/init.vim or ~/.config/nvim/init.lua.


# Contributing

This repository is personal, but feel free to fork and adapt for your own use. If you have suggestions, create an issue or pull request.
