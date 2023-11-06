# Get the current date in YYYYMMDD format
$current_date = Get-Date -Format "yyyyMMdd"

# Define the path to the date file

$documents_folder = [Environment]::GetFolderPath("MyDocuments")
$date_file = "$documents_folder\date_file.txt"

# Check if the date file exists and matches the current date
if (Test-Path $date_file) {
    $last_run_date = Get-Content $date_file
    if ($last_run_date -eq $current_date) {
        exit
    }
}

# If the date variable does not exist or does not match, proceed to copy the files
Copy-Item -Path "$documents_folder\own-docs\*" -Destination "H:\" -Recurse -Force

# Update the date file
$current_date | Out-File $date_file
