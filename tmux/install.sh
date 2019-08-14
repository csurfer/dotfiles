# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to tmux folder
readonly tmux=$dotfiles/tmux

cleanup () {
    # Remove previous tmux
    rm -rf ~/.tmux ~/.tmux.conf ~/.tmux.conf.local
}

setup () {
    cleanup

    # Clone oh-my-tmux
    git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux

    # Link the configuration
    ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf

    # Copy the customization changes
    cp $tmux/.tmux.conf.local $HOME
}

setup
