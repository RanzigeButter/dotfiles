#Requires -RunAsAdministrator
Write-Host -ForegroundColor Magenta @"

         888          888     .d888 d8b 888
         888          888    d88P"  Y8P 888
         888          888    888        888
     .d88888  .d88b.  888888 888888 888 888  .d88b.  .d8888b
    d88" 888 d88""88b 888    888    888 888 d8P  Y8b 88K
    888  888 888  888 888    888    888 888 88888888 "Y8888b.
d8b Y88b 888 Y88..88P Y88b.  888    888 888 Y8b.          X88
Y8P  "Y88888  "Y88P"   "Y888 888    888 888  "Y8888   88888P'
"@
Write-Host -ForegroundColor Yellow @"

------------------------------------------------------------

Author     : Tim Schneider
Website    : https://timschneider.xyz
Repository : https://github.com/RanzigeButter/dotfiles

------------------------------------------------------------

"@
Read-Host "Press ENTER to start"

# Preparations
# ==============================================================================

Write-Host "Preparing setup..." -NoNewline

# Set execution policy
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force

# Download repository
$dotfilesRepoUrl = "https://github.com/RanzigeButter/dotfiles/archive/master.zip"
$dotfilesZip = "$env:USERPROFILE\Downloads\dotfiles.zip"
(New-Object System.Net.WebClient).DownloadFile($dotfilesRepoUrl, $dotfilesZip)

# Unpack & delete zip file
Expand-Archive $dotfilesZip "$env:USERPROFILE\Downloads" -Force
Remove-Item $dotfilesZip

# Set path
$dotfiles = "$env:USERPROFILE\Downloads\dotfiles-master"

Write-Host " Done"

# Setup
# ==============================================================================

. "$dotfiles\.setup\windows.ps1"
. "$dotfiles\.setup\apps.ps1"
. "$dotfiles\.setup\copy.ps1"

# Finalize
# ==============================================================================

Remove-Item $dotfiles -Recurse -Force
Write-Host -ForegroundColor Yellow @"

------------------------------------------------------------

Congrats! Provided there were no hidden errors, the script
completed successfully and everything should be in place.

------------------------------------------------------------

"@
