# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Path to tmux folder
readonly tmux=$dotfiles/tmux

cleanup () {
    # Remove previous tmux
    red_msg "Cleaning up tmux and tmux.conf"
    rm -rf ~/.tmux ~/.tmux.conf ~/.tmux.conf.local
}

main () {
    cleanup

    green_msg "Setting up tmux and tmux.conf"

    # Clone oh-my-tmux
    git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux

    # Link the configuration
    ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf

    # Copy the customization changes
    cp $tmux/.tmux.conf.local $HOME
}

main
