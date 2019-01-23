# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to vim folder
readonly vim=$dotfiles/vim

cleanup () {
    # Remove previous vimified
    rm -rf ~/.vim ~/.vimrc
}

setup () {
    cleanup

    # Clone vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Install colorscheme
    mkdir ~/.vim/colors
    cp $vim/smyck.vim ~/.vim/colors

    # Copy vimrc
    cp $vim/vimrc ~/.vimrc

    # Plugin installation
    vim +PluginInstall +qall

    # YCM installation completion
    ~/.vim/bundle/YouCompleteMe/install.py
}

setup
