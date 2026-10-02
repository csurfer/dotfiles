# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Path to brew folder
readonly brew=$dotfiles/brew

# Operating System
os=`uname | tr '[:upper:]' '[:lower:]'`

# Set homebrew
homebrew () {
    which brew
    if [[ $? != 0 ]]; then
        # Install Homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew update
}

# Install or Upgrade brew formula
install_or_upgrade () {
    if brew ls --versions $1 > /dev/null; then
        # The package is installed
	    brew upgrade $1
    else
        # The package is not installed
	    brew install $1
    fi
}

# Install or Upgrade brew formula
cask_install_or_upgrade () {
    if brew ls --cask --versions $1 > /dev/null; then
        # The package is installed
	    brew upgrade --cask $1
    else
        # The package is not installed
	    brew install --cask $1
    fi
}

main () {
    # Ensure homebrew is setup
    green_msg "Installing homebrew"

    homebrew

    green_msg "Installing software via homebrew"

    # Install vim
    install_or_upgrade "vim"

    # Install zsh
    install_or_upgrade "zsh"

    # Install htop
    install_or_upgrade "htop"

    # Install wezterm
    if [[ $os == "darwin" ]]; then
        cask_install_or_upgrade "wezterm"
    else
        red_msg "Unable to install wezterm"
    fi

    # Install VisualStudioCode
    cask_install_or_upgrade "visual-studio-code"

    # Install nerd fonts
    cask_install_or_upgrade "font-hack-nerd-font"
}

main
