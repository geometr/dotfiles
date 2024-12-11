# ~/.bash_profile

# Если используется bash, подключить .bashrc, если он существует
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Специфичные настройки для интерактивной оболочки
case "$-" in
    *i*) 
        # Приветственное сообщение
        echo "Добро пожаловать, $(whoami)! Сессия началась: $(date '+%F %T')"
    ;;
esac

# Настройка среды для macOS или Linux
if [[ "$(uname -s)" == "Darwin" ]]; then
    # macOS-specific settings
    export PATH="/usr/local/bin:$PATH"
elif [[ "$(uname -s)" == "Linux" ]]; then
    # Linux-specific settings
    export PATH="/usr/bin:$PATH"
fi

# Инициализация окружения
# pyenv
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

# nvm
if [ -s "$HOME/.nvm/nvm.sh" ]; then
    . "$HOME/.nvm/nvm.sh"
    . "$HOME/.nvm/bash_completion"
fi