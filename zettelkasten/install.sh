# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Path to obsidian folder
readonly zettelkasten=$dotfiles/zettelkasten

cleanup () {
    # Remove previous tmux
    red_msg "Cleaning up configuration JSONs"
    rm ./*.json
}

main () {
    cleanup

    green_msg "Setting up Zettelkasten obsidian vault in current folder"

    # Setup the folders
    mkdir -p Zettelkasten Templates References Files

    # Setup config files
    mkdir -p .obsidian
    cp $zettelkasten/*.json .obsidian/

    # Setup templates
    cp $zettelkasten/Templates/*.md Templates/

    # Setup plugin configs
    mkdir -p .obsidian/plugins/iconic
    cp $zettelkasten/plugins/iconic/data.json .obsidian/plugins/iconic/

    # Post installation message
    yellow_msg "To complete the setup"
    yellow_msg "1. Open current folder as vault in Obsidian"
    yellow_msg "2. Enable community plugins"
    yellow_msg "3. Install Iconic and Dataview"
}

main
