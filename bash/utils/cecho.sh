#!/bin/bash
# shellcheck disable=SC2034,SC2059

# Colored Echo
cecho() {
    RED="\033[0;31m"
    GREEN="\033[0;32m"  # <-- [0 means not bold
    YELLOW="\033[1;33m" # <-- [1 means bold
    CYAN="\033[1;36m"
    # ... Add more colors if you like

    NC="\033[0m" # No Color

    printf "${!1}${2} ${NC}\n" # <-- bash
#     printf "${(P)1}${2} ${NC}\n" # <-- zsh
}
