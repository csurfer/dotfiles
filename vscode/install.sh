# Method to install extensions.
install_extension () {
    code --install-extension $1
}

setup () {
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

setup
