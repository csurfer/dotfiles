# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to oh-my-zsh
readonly omz=$HOME/oh-my-zsh

cleanup () {
    # Remove previous oh-my-zsh
    rm -rf $omz
}

set_zsh () {
    cleanup

    # Clone oh-my-zsh
    git clone git://github.com/robbyrussell/oh-my-zsh.git $omz

    # Clone zsh-autosuggestions
    git clone git://github.com/zsh-users/zsh-autosuggestions $omz/custom/plugins/zsh-autosuggestions

    # Setup links
    ln -sfn $omz $HOME/.oh-my-zsh
    ln -sfn $dotfiles/zsh/zshrc $HOME/.zshrc
}

set_zsh