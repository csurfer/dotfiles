# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Method to install extensions.
install_extension () {
    code --install-extension $1
}

main () {
    which code
    if [[ $? != 0 ]]; then
        red_msg "VSCode not installed. Exiting"
        exit
    fi

    green_msg "Setting up VSCode"

    # Install Material Theme.
    install_extension "Equinusocio.vsc-material-theme"
    install_extension "PKief.material-icon-theme"

    # Install XML support extension.
    install_extension "DotJoshJohnson.xml"

    # Install Python extension.
    install_extension "ms-python.python"

    # Install remote ssh.
    install_extension "ms-vscode-remote.remote-ssh"

    # Install vim extension.
    install_extension "vscodevim.vim"
}

main
