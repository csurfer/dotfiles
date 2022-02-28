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
function cheat () {
    curl http://cheat.sh/$1
}

# Git branch delete interactive.
function gbdint () {
    for f in `git branch`
    do
        read "choice?>>> Should I delete $fg[blue]$f$reset_color branch (Y|y|N|n)? "
        if [[ $choice =~ ^(Y|y)$ ]]
        then
            echo ">>>" $fg[red]"Deleting $f" $reset_color
            git branch -D $f
        else
            echo ">>>" $fg[green]"Not deleting $f" $reset_color
        fi
    done
}

# Open current folder in vscode.
function vscode () {
    code -n --folder-uri `pwd`
}

# Clean branch
function cb () {
    BRANCH=`git branch --show-current`
    if [[ $BRANCH = 'master' ]]
    then
        echo ">>>" $fg[green]"Not deleting "$BRANCH $reset_color
    else
        echo ">>>" $fg[red]"Deleting "$BRANCH" and switching to master" $reset_color
        git checkout master && git branch -D $BRANCH
    fi
    git pull
}

# Rebase current branch on latest master.
function rebase () {
    BRANCH=`git branch --show-current`
    if [[ $BRANCH = 'master' ]]
    then
        echo '>>> On master. Rebasing'
        git pull
    else
        echo '>>> On '$BRANCH' switching to master'
        git checkout master
        echo '>>> Rebasing master'
        git pull
        echo '>>> Switching back to '$BRANCH
        git checkout $BRANCH
        echo '>>> On '$BRANCH'. Rebasing'
        git rebase -i master
    fi
}
