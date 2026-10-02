# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Path to herdr folder
readonly herdr=$dotfiles/herdr

cleanup () {
    # Remove previous herdr config
    red_msg "Cleaning up herder configs"
    rm -rf ~/.config/herdr/config.toml
}

main () {
    cleanup

    green_msg "Installing herdr configs"

    # Copy herdr config
    mkdir -p ~/.config/herdr
    cp $herdr/config.toml ~/.config/herdr
}

main
