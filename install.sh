readonly dotfiles=$HOME/dotfiles

# Setup brew installables
sh $dotfiles/brew/install.sh

# Setup vim
sh $dotfiles/vim/install.sh

# Setup zsh
sh $dotfiles/zsh/install.sh

# Setup tmux
sh $dotfiles/tmux/install.sh

# Sublime restore instructions
sh $dotfiles/sublime/install.sh

# iterm2 font setup
sh $dotfiles/iterm2/install.sh
