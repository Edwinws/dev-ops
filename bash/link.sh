#!/usr/bin/env bash

# cd, following symlink https://stackoverflow.com/a/51651602/1014038
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# create symlinks of all executable files in the current directory (recursive) to $HOME/.local/bin except current file using find
find . -type f | while read -r file
do
    if [ "$file" = "$0" ]; then
        continue
    fi

    if [[ -x $file ]]; then
        ln -s -f "$(realpath "$file")" "$HOME/.local/bin/$(basename "$file")"
    fi
done

ls -l "$HOME/.local/bin"
