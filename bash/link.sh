#!/bin/bash

# recursively create symlinks of all executable files in the current directory to $HOME/.local/bin except current file
for file in *; do
    if [ "$file" = "$(basename "$0")" ]; then
        continue
    fi

    if [ -x "$file" ]; then
        ln -s -f "$(pwd)/$file" "$HOME/.local/bin/$file"
    fi
done
