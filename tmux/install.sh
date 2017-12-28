# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to tmux folder
readonly tmux=$dotfiles/tmux

cleanup () {
    # Remove previous tmux
    rm -rf ~/.tmux ~/.tmux.conf
}

setup () {
    cleanup

    # Copy tmux configuration
    cp $tmux/tmux.conf ~/.tmux.conf
    
    # Installation
    tmux source ~/.tmux.conf
}

setup
