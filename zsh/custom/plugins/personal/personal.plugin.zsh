# Export
export PATH=$PATH:/usr/local/lib/:$HOME/Library/
export PATH=$PATH:/usr/local/Cellar/python@2
export PATH=$PATH:/usr/local/Cellar/python
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/:$HOME/Library/

# Force tmux to use 256 colours.
alias tmux="tmux -2"
alias tma="tmux -2 attach-session -t"

# Git aliases.
alias gb='git branch --list $@'
alias gl='git log --pretty=format:"%Cred%h%Creset | %Cgreen%<(25)%an%Creset | %s"'
alias gs='git status'
alias gcm='git checkout master'
alias gpr='git pull --rebase'

# Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python tests
function pytest () {
    python setup.py test -q
    python3 setup.py test -q
}

# Grep specific files
function filegrep () {
    grep "$2" --include="*.$1" -IR .
}
function protogrep () {
    filegrep "proto" $1
}
function pygrep () {
    filegrep "py" $1
}
function javagrep () {
    filegrep "java" $1
}
function jsgrep () {
    filegrep "js" $1
}

# Cheatsheet
function cheat() {
    curl http://cheat.sh/$1
}
