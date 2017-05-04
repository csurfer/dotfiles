# Script directory
script_dir=$HOME/dotfiles

# Path to oh-my-zsh
OMZ=$HOME/.oh-my-zsh

# Clone oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git $OMZ

# Clone zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $OMZ/custom/plugins/zsh-autosuggestions

# Set zshrc
ln -s $script_dir/zsh/zshrc $HOME/.zshrc