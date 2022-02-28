# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Path to vim folder
readonly vim=$dotfiles/vim

cleanup () {
    # Remove previous vimified
    red_msg "Cleaning up vim and vimrc"
    rm -rf ~/.vim ~/.vimrc
}

main () {
    cleanup

    green_msg "Setting up vim and vimrc"

    # Clone vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Install colorscheme
    mkdir ~/.vim/colors
    cp $vim/smyck.vim ~/.vim/colors

    # Copy vimrc
    cp $vim/vimrc ~/.vimrc

    # Plugin installation
    vim +PluginInstall +qall
}

main
