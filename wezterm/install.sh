# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Path to wezterm folder
readonly wezterm=$dotfiles/wezterm

cleanup () {
    # Remove previous wezterm config
    red_msg "Cleaning up wezterm configs"
    rm -rf ~/.wezterm.lua
}

main () {
    cleanup

    green_msg "Installing wezterm configs"

    # Copy wezterm config
    cp $wezterm/wezterm.lua ~/.wezterm.lua
}

main
