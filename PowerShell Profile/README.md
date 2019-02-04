# **PowerShell Profile** <!-- omit in toc -->

My custom PowerShell Profile.

## Table of Contents <!-- omit in toc -->

- [**Installation**](#installation)
  - [For current User and Shell](#for-current-user-and-shell)
  - [For current User and all Shells](#for-current-user-and-all-shells)
  - [For all Users and current Shell](#for-all-users-and-current-shell)
  - [For all Users and Hosts](#for-all-users-and-hosts)
- [**Content**](#content)
  - [**Settings**](#settings)
    - [Colors](#colors)
    - [Font](#font)
    - [Miscellaneous](#miscellaneous)
    - [Window Title](#window-title)
    - [User Interface](#user-interface)
  - [**Functions**](#functions)
    - [General](#general)
    - [Directory](#directory)
    - [Git](#git)
    - [Node Package Manager (NPM)](#node-package-manager-npm)
    - [Webpack](#webpack)
    - [SSH](#ssh)
  - [**Aliases**](#aliases)
    - [General](#general-1)
    - [Directory](#directory-1)
    - [Git](#git-1)
    - [Node Package Manager (NPM)](#node-package-manager-npm-1)
    - [Webpack](#webpack-1)
    - [SSH](#ssh-1)
  - [**Clear-Host**](#clear-host)

## **Installation**

Before the installation we have to set our PowerShell execution policy to make use of Scripts.
To do this, enter the following command into your PowerShell:

````PowerShell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
````

Now there are four ways to install this profile:

### For current User and Shell

````plaintext
  C:\User\USERNAME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
````

### For current User and all Shells

````plaintext
  C:\User\USERNAME\Documents\WindowsPowerShell\profile.ps1
````

### For all Users and current Shell

````plaintext
  C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1
````

### For all Users and Hosts

````plaintext
  C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1
````

## **Content**

Summary of all the things this profile contains.

**Note:** Commands are not case-sensitive.


---


### **Settings**

First, all other settings stored in the Registry are deleted to ensure that all windows look the same.

#### Colors

````plaintext
  Black (Hex #0f1218 / RGB 15,18,24)
  DarkBlue (Hex #0037da / RGB 0,55,218)
  DarkGreen (Hex #13a10e / RGB 19,161,14)
  DarkCyan (Hex #3a96dd / RGB 58,150,221)
  DarkRed (Hex #c50f1f / RGB 197,15,31)
  DarkMagenta (Hex #881798 / RGB 136,23,152)
  DarkYellow (Hex #c19c00 / RGB 193,156,0)
  Gray (Hex #cccccc / RGB 204,204,204)
  DarkGray (Hex #767676 / RGB 118,118,118)
  Blue (Hex #3b78ff / RGB 59,120,255)
  Green (Hex #a3be8c / RGB 163,190,140)
  Cyan (Hex #88c0d0 / RGB 136,192,208)
  Red (Hex #e74856 / RGB 231,72,86)
  Magenta (Hex #b4009e / RGB 180,0,158)
  Yellow (Hex #ebcb8b / RGB 235,203,139)
  White (Hex #f8f8f8 / RGB 248,248,248)
````

#### Font

````plaintext
  Font = Consolas
  Font Size = 18
  Font Weight = 400
````

#### Miscellaneous

````plaintext
  Window Opacity = 95%
  Break long lines into multiple rows = Yes
  History Buffer Size = 50
  Number of History Buffers = 3
  Retain duplicate History Entries = No
  Quick Edit = Yes
  Insert Mode = Yes
````

#### Window Title

The window title contains the following information: The name of the program and the current user, whether the application is running as an administrator or not, and the date of the current day.

#### User Interface

This determines which colors are to be used for what.

````PowerShell
  $Host.UI.RawUI.BufferSize = new-object System.Management.Automation.Host.Size(125, 3000)
  $Host.UI.RawUI.WindowSize = new-object System.Management.Automation.Host.Size(125, 50)
  $Host.UI.RawUI.CursorSize = "25"
  $Host.UI.RawUI.ForegroundColor = "White"
  $Host.UI.RawUI.BackgroundColor = "Black"
  $Host.PrivateData.ErrorForegroundColor = "Red"
  $Host.PrivateData.ErrorBackgroundColor = "Black"
  $Host.PrivateData.WarningForegroundColor = "Yellow"
  $Host.PrivateData.WarningBackgroundColor = "Black"
  $Host.PrivateData.DebugForegroundColor = "Yellow"
  $Host.PrivateData.DebugBackgroundColor = "Black"
  $Host.PrivateData.VerboseForegroundColor = "Yellow"
  $Host.PrivateData.VerboseBackgroundColor = "Black"
  $Host.PrivateData.ProgressForegroundColor = "Yellow"
  $Host.PrivateData.ProgressBackgroundColor = "Black"
````


---


### **Functions**

List of all contained functions.

#### General

- `C` = Clear PowerShell
- `X` = Close PowerShell
- `Open_PowerShell` = Open new PowerShell Window
- `Open_PowerShell_Admin` = Open new PowerShell Window as Admin
- `Shutdown_Timer` = Shutdown with timer (Insert the desired time in minutes after the command.)
- `Shutdown_Abort` = Abort Shutdown

#### Directory

- `..` = One folder up
- `...` = Two folders up
- `....` = Three folders up
- `~` = Change directory to Home
- `Dir_Desktop` = Change directory to Desktop
- `Dir_Dropbox` = Change directory to Dropbox
- `Dir_Downloads` = Change directory to Downloads
- `Dir_Homepage` = Change directory to Homepage
- `Dir_Print` = Prints the directory contents into a .csv file (The file is located in the corresponding directory.)

#### Git

[Git](https://git-scm.com) must be installed!

- `Git_AddAndCommit` = Add and commit files with message (Insert the desired message after the command.)
- `Git_AddAndCommit_Amend` = Amend to the last commit without editing the message
- `Git_Push` = Push files to remote Repository (Insert the desired Branch after the command.)
- `Git_Pull` = Pull files from remote Repository (Insert the desired Branch after the command.)
- `Git_Remote` = Add remote Repository (Insert the desired URL after the command.)
- `Git_Clone` = Clone Repository into directory (Insert the desired URL after the command.)

#### Node Package Manager (NPM)

[NodeJS/NPM](https://nodejs.org) must be installed!

- `NPM_Install_Dependencies` = Install Package in dependencies (Insert the desired Package after the command.)
- `NPM_Install_DevDependencies` = Install Package in devDependencies (Insert the desired Package after the command.)
- `NPM_Outdated` = Outdated Packages
- `NPM_Update` = Update Packages
- `NPM_Audit` = Audit Packages

#### Webpack

[Webpack](https://webpack.js.org) configuration must be provided!

- `Webpack_Development` = Development
- `Webpack_Production` = Production

#### SSH

[OpenSSH](https://www.openssh.com) must be installed!

- `SSH_RasPi0` = SSH to RaspberryPi 0 W


---


### **Aliases**

List of all contained aliases.

#### General

- `OP` = `Open_PowerShell`
- `OPA` = `Open_PowerShell_Admin`
- `ST` = `Shutdown_Timer`
- `SA` = `Shutdown_Abort`

#### Directory

- `DDT` = `Dir_Desktop`
- `DDB` = `Dir_Dropbox`
- `DDL` = `Dir_Downloads`
- `DHP` = `Dir_Homepage`
- `DP` = `Dir_Print`

#### Git

[Git](https://git-scm.com) must be installed!

- `GAC` = `Git_AddAndCommit`
- `GACA` = `Git_AddAndCommit_Amend`
- `GSH` = `Git_Push`
- `GLL` = `Git_Pull`
- `GR` = `Git_Remote`
- `GG` = `Git_Clone`

#### Node Package Manager (NPM)

[NodeJS/NPM](https://nodejs.org) must be installed!

- `ND` = `NPM_Install_Dependencies`
- `NDD` = `NPM_Install_DevDependencies`
- `NO` = `NPM_Outdated`
- `NU` = `NPM_Update`
- `NA` = `NPM_Audit`

#### Webpack

[Webpack](https://webpack.js.org) configuration must be provided!

- `WD` = `Webpack_Development`
- `WP` = `Webpack_Production`

#### SSH

[OpenSSH](https://www.openssh.com) must be installed!

- `RPI0` = `SSH_RasPi0`


---


### **Clear-Host**

Clear PowerShell after the profile has been loaded.