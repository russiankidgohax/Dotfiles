# Define the source and destination directories
$src_dir = "~\AppData\Roaming\helix"
$dest_dir = "."

# Check if destination directory exists, if not create it
if (!(Test-Path -path $dest_dir)) {
    New-Item -ItemType Directory -Force -Path $dest_dir
}

# Copy the files
Copy-Item "$src_dir\config.toml" "$dest_dir\config.toml"
Copy-Item "$src_dir\languages.toml" "$dest_dir\languages.toml"

Write-Host "Helix configuration files have been updated successfully in $dest_dir."
