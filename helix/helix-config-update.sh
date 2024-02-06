#!/bin/bash
# shellcheck disable=SC1017

# Define the source and destination directories
src_dir="$HOME/.config/helix"
dest_dir="."

# Check if destination directory exists, if not create it
if [ ! -d "$dest_dir" ]; then
    mkdir -p "$dest_dir"
fi

# Copy the files
cp "$src_dir/config.toml" "$dest_dir/config.toml"
cp "$src_dir/languages.toml" "$dest_dir/languages.toml"

echo "Helix configuration files have been updated successfully in $dest_dir."
