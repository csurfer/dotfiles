# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Operating system
readonly os=`uname | tr '[:lower:]' '[:upper:]'`

# Path to font folder for user
if [[ $os == "darwin" ]]; then
    fonts=$HOME/Library/Fonts
else
    fonts=$HOME/.fonts/meslo-fonts
fi

run () {
    green_msg "Downloading Meslo font in $fonts"

    mkdir -p $fonts
    # Install required font
    wget -O $fonts/Meslo-LG-M-Regular-for-Powerline.ttf https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
}

run
