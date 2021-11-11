Write-Host -ForegroundColor Yellow @"

         888          888     .d888 d8b 888
         888          888    d88P"  Y8P 888
         888          888    888        888
     .d88888  .d88b.  888888 888888 888 888  .d88b.  .d8888b
    d88" 888 d88""88b 888    888    888 888 d8P  Y8b 88K
    888  888 888  888 888    888    888 888 88888888 "Y8888b.
d8b Y88b 888 Y88..88P Y88b.  888    888 888 Y8b.          X88
Y8P  "Y88888  "Y88P"   "Y888 888    888 888  "Y8888   88888P'

"@

# Install Apps
# ==============================================================================

# WinGet
foreach ($package in @(
    # General
    "Google.Chrome"
    "Discord.Discord"
    "Spotify.Spotify"
    "Dropbox.Dropbox"
    "VideoLAN.VLC"

    # Productivity
    "Microsoft.VisualStudioCode"
    "Git.Git"
    "OpenJS.NodeJS.LTS"

    # Games
    "Valve.Steam"
  )) {
  winget install -i $package
}

# Manual
Start-Process "https://www.jetbrains.com/lp/mono/"
Start-Process "https://windows.php.net/download/"
Start-Process "https://getcomposer.org/download/"

# Reload Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Download Dotfiles
# ==============================================================================

Write-Host -NoNewline "Downloading dotfiles..."

# Download repository
$dotfilesRepoUrl = "https://github.com/RanzigeButter/dotfiles/archive/master.zip"
$dotfilesZip = "$env:USERPROFILE\Downloads\dotfiles.zip"
(New-Object System.Net.WebClient).DownloadFile($dotfilesRepoUrl, $dotfilesZip)

# Unpack & delete zip file
Expand-Archive $dotfilesZip "$env:USERPROFILE\Downloads"
Remove-Item $dotfilesZip

# Set path
$dotfiles = "$env:USERPROFILE\Downloads\dotfiles-master"

Write-Host " Done"

# Install Dotfiles
# ==============================================================================

# PowerShell Profile
Write-Host -NoNewline "Installing PowerShell profile..."
if (!(Test-Path "$env:USERPROFILE\Documents\WindowsPowerShell")) {
  New-Item -ItemType Directory "$env:USERPROFILE\Documents\WindowsPowerShell" | Out-Null
}
Copy-Item "$dotfiles\powershell\profile.ps1" "$env:USERPROFILE\Documents\WindowsPowerShell\profile.ps1"
Write-Host " Done"

# Windows Terminal
Write-Host -NoNewline "Installing Windows Terminal settings..."
$dirWT = Get-ChildItem "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_*" | Select-Object -First 1 -Expand FullName
Copy-Item "$dotfiles\terminal\settings.json" "$dirWT\LocalState\settings.json"
Write-Host " Done"

# VS Code
Write-Host "Installing VS Code settings & extensions..."
Write-Host ">>> settings"
Copy-Item "$dotfiles\vscode\settings.json" "$env:APPDATA\Code\User\settings.json"
foreach ($extension in @(
    Get-Content "$dotfiles\vscode\extensions.md" |
    Where-Object { $_ -match "- " } |
    ForEach-Object { $_.trimStart("- ") }
  )) {
  Write-Host ">>> $extension"
  code --install-extension $extension | Out-Null
}

# SSH
Write-Host -NoNewline "Installing SSH config..."
if (!(Test-Path "$env:USERPROFILE\.ssh")) {
  New-Item -ItemType Directory "$env:USERPROFILE\.ssh" | Out-Null
}
Copy-Item "$dotfiles\ssh\config" "$env:USERPROFILE\.ssh\config"
Write-Host " Done"

# Git
Write-Host -NoNewline "Installing Git config..."
if (!(Test-Path "$env:USERPROFILE\.config\git")) {
  New-Item -ItemType Directory "$env:USERPROFILE\.config\git" | Out-Null
}
Copy-Item "$dotfiles\git\config" "$env:USERPROFILE\.config\git\config"
Write-Host " Done"

# ==============================================================================

Remove-Item -Recurse -Force $dotfiles
Write-Host -ForegroundColor Yellow @"

Apps & Dotfiles installed!

"@
