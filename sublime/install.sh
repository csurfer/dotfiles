# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to sublime
readonly sublime="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

set_sublime () {
    # Create needed directories
    mkdir -p "$sublime"

    # Setup links
    cp "$dotfiles/sublime/Package Control.sublime-settings" "$sublime/Package Control.sublime-settings"
    # Execute the following after all packages are installed
    echo "Copy Preferences.sublime-settings into \"Sublime Text 3/Packages/User\" to apply settings."
    # cp "$dotfiles/sublime/Preferences.sublime-settings" "$sublime/Preferences.sublime-settings"
}

set_sublime