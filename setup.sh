script_dir=$HOME/dotfiles

# Clone dotfiles repository.
git clone https://github.com/csurfer/dotfiles.git $script_dir

# Install environments.
sh $script_dir/install.sh