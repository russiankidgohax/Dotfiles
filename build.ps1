param([string]$file_name)

if ([string]::IsNullOrEmpty($file_name)) {
    Write-Host "Error: No file name provided. Please provide a file name."
    exit 1
}

$file_base_name = [System.IO.Path]::GetFileNameWithoutExtension($file_name)
pandoc.exe $file_name -s -o .\$file_base_name.pdf --pdf-engine tectonic --filter pandoc-plantuml -V colorlinks=true -V urlcolor="purple" -V mainfont="Montserrat" -V monofont="JetBrainsMono"
Start-Process .\$file_base_name.pdf
Remove-Item .\plantuml-images\* -Force

