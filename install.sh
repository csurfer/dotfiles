readonly dotfiles=$HOME/dotfiles

# Operating System on which to install
os=`uname | tr '[:upper:]' '[:lower:]'`

# Setup brew installables
sh $dotfiles/brew/${os}_install.sh

# Setup vim
sh $dotfiles/vim/install.sh

# Setup zsh
sh $dotfiles/zsh/install.sh

# Setup tmux
sh $dotfiles/tmux/install.sh

# VSCode installation
sh $dotfiles/vscode/install.sh

# term font setup
sh $dotfiles/term/${os}_install.sh
