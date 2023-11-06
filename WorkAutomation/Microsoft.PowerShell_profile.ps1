Set-PSReadLineKeyHandler -Chord "Ctrl+w" -Function BackwardKillWord
oh-my-posh init pwsh --config 'C:\Users\dorw_lu\AppData\Local\Programs\oh-my-posh\themes\easy-term.omp.json' | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Alias "ex" "explorer"

C:\\Users\\dorw_lu\\Documents\\own-docs\\Dotfiles\\WorkAutomation\\copy_own_docs_to_H_drive.ps1
