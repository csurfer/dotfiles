# Export
export PATH=$PATH:/usr/local/lib/:$HOME/Library/
export PATH=$PATH:/usr/local/Cellar/python@2
export PATH=$PATH:/usr/local/Cellar/python
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/Users/vishwassharma/Library/Python/3.9/bin
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/:$HOME/Library/

# Force tmux to use 256 colours.
alias tmux="tmux -2"
alias tma="tmux -2 attach-session -t"

# Git aliases.
alias gb='git branch --list $@'
alias gl='git log --pretty=format:"%Cred%h%Creset | %Cgreen%<(25)%an%Creset | %s"'
alias gs='git status'

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
        if [[ $f == '*' ]]
        then
            continue
        fi
        if [[ $f == 'master' ]]
        then
            continue
        fi

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
    code -r --folder-uri `pwd`
}

function default_branch() {
    BR='master'
    for f in `git branch`
    do
        if [[ $f == 'main' ]]
        then
            BR='main'
            break
        fi
    done
    echo $BR
}

# Clean branch
function cb () {
    DEFAULT=$(default_branch)
    BRANCH=`git branch --show-current`
    if [[ $BRANCH = $DEFAULT ]]
    then
        echo ">>>" $fg[green]"Not deleting "$BRANCH $reset_color
    else
        echo ">>>" $fg[red]"Deleting "$BRANCH" and switching to "$DEFAULT $reset_color
        git checkout $DEFAULT && git branch -D $BRANCH
    fi
    git pull
}

# Push branch
function push () {
    DEFAULT=$(default_branch)
    BRANCH=`git branch --show-current`
    if [[ $BRANCH = $DEFAULT ]]
    then
        echo ">>>" $fg[red]"Not pushing "$BRANCH $reset_color
    else
        echo ">>>" $fg[green]"Pushing branch "$BRANCH" to origin" $reset_color
        git push origin $BRANCH -f
    fi
}

# Rebase current branch on latest master.
function rebase () {
    DEFAULT=$(default_branch)
    BRANCH=`git branch --show-current`
    if [[ $BRANCH = $DEFAULT ]]
    then
        echo '>>>' $fg[green]'On '$DEFAULT'. Rebasing' $reset_color
        git pull
    else
        echo '>>>' $fg[green]'On '$BRANCH' switching to '$DEFAULT $reset_color
        git checkout $DEFAULT
        echo '>>>' $fg[green]'Rebasing '$DEFAULT $reset_color
        git pull
        echo '>>>' $fg[green]'Switching back to '$BRANCH $reset_color
        git checkout $BRANCH
        echo '>>>' $fg[green]'On '$BRANCH'. Rebasing' $reset_color
        git rebase -i $DEFAULT
    fi
}

function speed () {
    python3 -m timeit -c $1
}

function git_recursive_gc () {
    echo '>>> Cleaning all git directories under '$1
    echo ''
    for dir in $1/*;
    do;
        if [[ -d $dir && -d $dir/.git ]]
        then
            echo '>>> Cleaning git directory '$dir
            cd $dir
            git gc --prune=now
            cd $1
            echo '>>> Done'
            echo ''
        fi
    done;
}
