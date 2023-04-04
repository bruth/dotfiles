# Platform name.
export PLATFORM="${OSTYPE//[0-9\.]}"

export TERM="xterm-color"
export EDITOR="nvim"
export CLICOLOR=1
export GREP_OPTIONS="--color=auto"

if [ $PLATFORM == "darwin" ]; then
    # bash completion
    if [[ -z brew && $(brew --prefix)/etc/bash_completion ]]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

alias ls="ls -G"
alias tmux="TERM=screen-256color-bce tmux"


export PATH="$HOME/.fly/bin:$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$PATH"
export GPG_TTY=$(tty)
