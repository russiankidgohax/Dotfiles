param([string]$file_name)

if ([string]::IsNullOrEmpty($file_name)) {
    Write-Host "Error: No file name provided. Please provide a file name."
    exit 1
}

$file_base_name = [System.IO.Path]::GetFileNameWithoutExtension($file_name)

if (Test-Path ".\$file_base_name.pdf") {
    Remove-Item .\$file_base_name.pdf
}

pandoc.exe $file_name -s -o .\$file_base_name.pdf --pdf-engine xelatex --filter pandoc-plantuml -V colorlinks=true -V urlcolor="purple" -V mainfont="Montserrat" -V monofont="JetBrainsMono-Bold"

if (!(Test-Path ".\$file_base_name.pdf")) {
    Write-Host "Error: File could not be pandoced to .\$file_base_name.pdf."
    exit 1
}

Start-Process .\$file_base_name.pdf

if (Test-Path ".\plantuml-images") {
    Remove-Item .\plantuml-images\* -Force
}

