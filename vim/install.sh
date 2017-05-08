# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to vimified
readonly vim=$HOME/vimified

cleanup () {
    # Remove previous vimified
    rm -rf $vim
}

set_vim () {
    cleanup

    # Clone vimified
    git clone git://github.com/zaiste/vimified.git $vim

    # Clone vundle
    mkdir -p $vim/bundle/vundle
    git clone https://github.com/gmarik/vundle.git $vim/bundle/vundle

    # Create directory to set up temporary files
    mkdir -p $vim/tmp/backup
    mkdir -p $vim/tmp/swap
    mkdir -p $vim/tmp/undo

    # Setup links
    ln -sfn $vim $HOME/.vim
    ln -sfn $vim/vimrc $HOME/.vimrc
    ln -sfn $dotfiles/vim/local.vimrc $vim/local.vimrc

    # Install basic packages
    cd $vim
    vim +BundleInstall +qall

    # Set specifics
    ln -sfn $dotfiles/vim/after.vimrc $vim/after.vimrc

    cd $HOME
}

set_vim
