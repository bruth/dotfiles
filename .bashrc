# vi bindings
set -o vi

# cleaned up platform name
export PLATFORM="${OSTYPE//[0-9\.]}"

# Setup some colors to use later in interactive shell or scripts
export NC='\[\e[m\]' # No Color
export BLACK='\[\e[0;30m\]'
export GRAY='\[\e[1;30m\]'
export RED='\[\e[0;31m\]'
export LIGHT_RED='\[\e[1;31m\]'
export GREEN='\[\e[0;32m\]'
export LIGHT_GREEN='\[\e[1;32m\]'
export BROWN='\[\e[0;33m\]'
export YELLOW='\[\e[1;33m\]'
export BLUE='\[\e[0;34m\]'
export LIGHT_BLUE='\[\e[1;34m\]'
export PURPLE='\[\e[0;35m\]'
export LIGHT_PURPLE='\[\e[1;35m\]'
export CYAN='\[\e[0;36m\]'
export LIGHT_CYAN='\[\e[1;36m\]'
export LIGHT_GRAY='\[\e[0;37m\]'
export WHITE='\[\e[1;37m\]'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

# Starts an HTTP server from a directory
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}"
    python SimpleHTTPServer "$port"
}

export PS1="${GRAY}\h ${RED}$(parse_git_branch)${BLUE}\w${NC}\n% " 
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

export TERM="xterm-color"
export PATH="$HOME/.rbenv/bin:$HOME/.rvm/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

export PYTHON_EGG_CACHE="/tmp"
export EVENT_NOKQUEUE=1
export GREP_OPTIONS="--color=auto"
export CLICOLOR=1

# Initialize RVM
if [ -f $HOME/.rvm/scripts/rvm ]; then
    . $HOME/.rvm/scripts/rvm
fi


if [ $PLATFORM == "darwin" ]; then
    # MacVim
    export EDITOR="mvim"
    export VISUAL="mvim" 

    # Go
    export GOROOT=`brew --cellar go`
    export GOOS=darwin
    export GOARCH=amd64
    export GOBIN=/usr/local/bin

    export CC=clang
    export CXX=clang
    export FFLAGS=-ff2c
else
    export EDITOR="vim"
    export VISUAL="vim -g"
fi

alias ls="ls -G"
alias hgrep="history | grep"
alias tmux="TERM=screen-256color-bce tmux"

alias webfaction="ssh thedevel@thedevel.webfactional.com"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs

VIRTUALENV_WRAPPER=/usr/local/bin/virtualenvwrapper.sh
if [ -f $VIRTUALENV_WRAPPER ]; then
    source $VIRTUALENV_WRAPPER
fi
