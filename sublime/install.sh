# Path to dotfiles
readonly dotfiles=$HOME/dotfiles

# Path to sublime folder
readonly sublime=$dotfiles/sublime

setup () {
    echo "1. Install SublimeText3.";
    echo "2. Install PackageControl and PackageSync plugins.";
    echo "3. You can now restore your sublime settings using PackageSync from $sublime/SublimePackagesBackup.zip";
}

setup
