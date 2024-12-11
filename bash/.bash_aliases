# Aliases for general use
alias :q=exit
alias c='clear'  # Clear the terminal screen
alias h='history' # View the bash history
alias cpr='rsync --progress' # Copy files with progress indicator

# Enhanced ls and grep with color output
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# View the calender by typing the first three letters of the month.
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'

# File and directory management
alias tree='tree --dirsfirst -F' # Better display of directory structure
alias mkdir='mkdir -p -v'       # Create directories with verbosity
alias rm='rm -i'                # Confirm before deleting files
alias mv='mv -i'                # Confirm before moving files
alias cp='cp -i'                # Confirm before copying files

# Git shortcuts
alias gs='git status'           # View Git status
alias ga='git add'              # Add a file to Git
alias gaa='git add --all'       # Add all files to Git
alias gc='git commit'           # Commit changes to Git
alias gl='git log --oneline'    # View Git log in a concise format
alias gb='git checkout -b'      # Create and switch to a new branch
alias gd='git diff'             # View differences

# Custom navigation and editing
alias fvi='nvim $(find . /etc ~ -not -path "*.pyc" -not -path "*/_cacache/*" -not -path "*/.cache/*" -not -path "*/.git/*" 2>&1 | grep -v "Permission denied" | fzf)' # Open files interactively

# Networking and troubleshooting
alias pingg='ping -c 5 google.com' # Quick test of internet connectivity
alias ports='netstat -tulanp'      # List open ports

# Miscellaneous utilities
alias reload_aliases='source ~/.bash_aliases' # Reload aliases without restarting the shell
alias myip='curl ifconfig.me'                # Get public IP address
alias dfh='df -h'                            # Human-readable disk usage

# Platform-specific adjustments
if [[ "$(uname)" == "Linux" ]]; then
    alias open='xdg-open' # Open files with default application
elif [[ "$(uname)" == "Darwin" ]]; then
    alias open='open'     # macOS equivalent
fi