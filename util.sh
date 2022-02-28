RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'

NC='\033[0m' # No Color

green_msg () {
    printf "\n>>> ${GREEN}$1${NC}\n"
}

red_msg () {
    printf "\n>>> ${RED}$1${NC}\n"
}

yellow_msg () {
    printf "\n>>> ${YELLOW}$1${NC}\n"
}

entering_msg () {
    yellow_msg "Running `realpath ${0}`"
}
