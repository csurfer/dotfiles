# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to brew folder
readonly brew=$dotfiles/brew

# Set homebrew
homebrew () {
    which -s brew
    if [[ $? != 0 ]]; then
        # Install Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        brew update
    fi
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
    if brew cask ls --versions $1 > /dev/null; then
        # The package is installed
	    brew cask upgrade $1
    else
        # The package is not installed
	    brew cask install $1
    fi
}

setup () {
    # Ensure homebrew is setup
    homebrew

    # Install vim
    install_or_upgrade "vim"

    # Install zsh
    install_or_upgrade "zsh"

    # Install tmux
    install_or_upgrade "tmux"

    # Install htop
    install_or_upgrade "htop"

    # Install iterm2
    cask_install_or_upgrade "iterm2"

    # Install fuzzy search
    install_or_upgrade "fzf"
    $(brew --prefix)/opt/fzf/install

    # Install download utilities
    brew install youtube-dl
    brew install wget
    brew install httpie

    # Install shell stuff
    brew install bat
    brew install nnn
    brew install googler
}

setup
