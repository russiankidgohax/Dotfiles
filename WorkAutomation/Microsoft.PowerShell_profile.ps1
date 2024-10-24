Set-PSReadLineKeyHandler -Chord "Ctrl+w" -Function BackwardKillWord

# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Alias ex explorer
Set-Alias open explorer
Set-Alias which Get-Command
Set-Alias lg lazygit
Set-Alias lazy lazygit
Set-Alias c conda

function Update-Profile {
  . $PROFILE; refreshenv;
}
Set-Alias update Update-Profile
Set-Alias ud Update-Profile

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

function Get-Full-History {
  cat (Get-PSReadlineOption).HistorySavePath
}
Set-Alias gfh Get-Full-History

function Load-Posh-Theme {
  oh-my-posh init pwsh --config $env:USERPROFILE\easy-owned.omp.json | Invoke-Expression
}

Set-Alias lpt Load-Posh-Theme


function Update-Programs {
  winget upgrade --all --include-unknown
  choco upgrade all
  scoop update --all
  scoop status
  deno upgrade
  python -m pip install --upgrade pip
  conda update -n base -c conda-forge conda
}

Set-Alias up Update-Programs

function Make-Dir-And-Change-To-Dir {
  param (
      [string]$dirName
  )
  mkdir $dirName
  cd $dirName
}
Set-Alias mc Make-Dir-And-Change-To-Dir

function Print-Env {
  Get-ChildItem Env:;
}

Set-Alias -Name printenv -Value Print-Env

Set-Alias python3.11 "C:\\Users\\dorw_lu\\AppData\\Local\\Programs\\Python\\Python311\\python.exe"
Set-Alias python3.12 "C:\\Users\\dorw_lu\\AppData\\Local\\Programs\\Python\\Python312\\python.exe"

oh-my-posh init pwsh --config ~\easy-owned.omp.json | Invoke-Expression

$IsWorkPC = $env:WORK_PC
if ($IsWorkPC -eq 1) {
  Load-Posh-Theme
}
