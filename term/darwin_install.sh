# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to term folder
readonly term=$dotfiles/term

# Path to font folder for user
readonly fonts=~/Library/Fonts

setup () {
    # Install required font
    wget -O $fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
}

setup
