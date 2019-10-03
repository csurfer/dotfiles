# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to brew folder
readonly brew=$dotfiles/brew

# Set homebrew
homebrew () {
    which brew
    if [ $? != 0 ]; then
        # Install Homebrew
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
        eval $($HOME/linuxbrew/.linuxbrew/bin/brew shellenv)
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

    # Install fuzzy search
    install_or_upgrade "fzf"
    $(brew --prefix)/opt/fzf/install

    # Install download utilities
    install_or_upgrade "youtube-dl"
    install_or_upgrade "wget"
    install_or_upgrade "httpie"

    # Install shell stuff
    install_or_upgrade "bat"
    install_or_upgrade "nnn"
    install_or_upgrade "googler"
    install_or_upgrade "fd"
    install_or_upgrade "hyperfine"
    install_or_upgrade "the_silver_searcher"

    # Install cmake
    install_or_upgrade "cmake"

    # Install tldr
    install_or_upgrade "tldr"
}

setup
