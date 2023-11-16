oh-my-posh init pwsh --config 'C:\Users\dorw_lu\Documents\own-docs\Dotfiles\themes\easy-owned.omp.json' | Invoke-Expression
Set-PSReadLineKeyHandler -Chord "Ctrl+w" -Function BackwardKillWord

# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Alias ex explorer
Set-Alias which Get-Command
Set-Alias lg lazygit
Set-Alias lazy lazygit
Set-Alias c conda

function Conda-Deactivate {
  conda deactivate
}
Set-Alias cda Conda-Deactivate

function Conda-Activate {
    param (
        [Parameter(Mandatory=$true)]
        [string]$env
    )
    conda activate $env
}
Set-Alias ca Conda-Activate


function Start-Activity-Browser {
  conda activate ab
  activity-browser
}
Set-Alias "ab" Start-Activity-Browser

function Run-Cargo {
  cargo run $args
}
Set-Alias cr Run-Cargo

$IsWorkPC = $env:WORK_PC
if ($IsWorkPC) {
  C:\\Users\\dorw_lu\\Documents\\own-docs\\Dotfiles\\WorkAutomation\\copy_own_docs_to_H_drive.ps1
}
