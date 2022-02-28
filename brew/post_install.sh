# Fuzzy search installs shell specific profile commands so it better be done at last.

# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Install fuzzy search
if brew ls --versions "fzf" > /dev/null; then
    # The package is installed
    brew upgrade "fzf"
else
    # The package is not installed
    brew install "fzf"
fi

green_msg "Installing fuzzy search after brew and zsh installation"
$(brew --prefix)/opt/fzf/install
