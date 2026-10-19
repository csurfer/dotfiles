# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Path to obsidian folder
readonly obsidian=$dotfiles/obsidian
# Path to system SecondBrain vault
readonly secondbrain=$HOME/SecondBrain

main () {
    # Avoid overwriting an existing vault.
    if [ -e $secondbrain ]; then
        yellow_msg "$secondbrain already exists, skipping to avoid overwrites"
        return 0
    fi

    green_msg "Setting up SecondBrain vault at $secondbrain"

    # Copy the vault and create its empty folders.
    cp -r $obsidian/SecondBrain $secondbrain
    mkdir -p $secondbrain/raw/assets
    mkdir -p $secondbrain/wiki/people $secondbrain/wiki/projects $secondbrain/wiki/areas
    mkdir -p $secondbrain/wiki/resources $secondbrain/wiki/concepts $secondbrain/wiki/ideas

    # Post installation message
    yellow_msg "To complete the setup"
    yellow_msg "1. Open Obsidian and choose 'Open folder as vault'"
    yellow_msg "2. Select $secondbrain"
    yellow_msg "3. Run claude inside $secondbrain to use CLAUDE.md"
}

main
