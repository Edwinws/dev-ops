#!/usr/bin/env bash

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
