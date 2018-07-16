# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to zsh folder
readonly zsh=$dotfiles/zsh

# Path to oh my zsh
readonly omz=$HOME/.oh-my-zsh

cleanup () {
    # Remove previous oh-my-zsh
    rm -rf ~/.oh-my-zsh ~/.zshrc
}

setup () {
    cleanup

    # Clone oh-my-zsh
    git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh.git $omz

    # Clone zsh-autosuggestions
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $omz/custom/plugins/zsh-autosuggestions

    # Clone zsh-autocompletions
    git clone --depth 1 https://github.com/zsh-users/zsh-completions $omz/custom/plugins/zsh-completions

    # Clone tmux-repl
    git clone https://github.com/csurfer/tmuxrepl.git $omz/custom/plugins/tmuxrepl

    # Copy zshrc
    cp $zsh/zshrc ~/.zshrc

    # Copy custom plugins
    cp -r $zsh/custom $omz
}

setup
