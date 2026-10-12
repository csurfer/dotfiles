# Path to dotfiles
readonly dotfiles=$HOME/dotfiles
# Load utility file
[ -f $dotfiles/util.sh ] && . $dotfiles/util.sh
entering_msg

# Path to system ai folder
readonly agentscommon=~/agents-common
# Path to ai folder
readonly ai=$dotfiles/ai

main () {
    # Create agents-common folder.
    mkdir -p $agentscommon
    mkdir -p $agentscommon/skills
    mkdir -p $agentscommon/objectives

    # Copy the AGENTS.md file within agents-common
    cp $ai/AGENTS.md $agentscommon
}

main
