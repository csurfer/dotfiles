# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Setup brew installables
sh $dotfiles/brew/install.sh

# Setup vim
sh $dotfiles/vim/install.sh

# Setup zsh
sh $dotfiles/zsh/install.sh

# Setup wezterm
sh $dotfiles/wezterm/install.sh

# Setup herdr
sh $dotfiles/herdr/install.sh

# Post brew install.
sh $dotfiles/brew/post_install.sh
