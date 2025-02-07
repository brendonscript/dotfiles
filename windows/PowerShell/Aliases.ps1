$dotfiles = "$HOME\.dotfiles"

function NpmIntall {
  npm install
}

function NpmStart {
  npm run start
}

function NpmBuild {
  npm run build
}

function NpmInstallStart {
  npm install && npm run start
}

function NpmTest {
  npm test
}

function CodeCd {
  Set-Location "G:\"
}

function WorkCd {
  Set-Location "G:\Work"
}

function EditProfile {
  code $PROFILE
}

function WingetBackupScript {
    winget export -o "$dotfiles\windows\winget-packages.json"
}

function ScoopBackupScript {
  scoop export -c | Out-File -FilePath "$dotfiles\windows\scoop-packages.json"
}

function ChocoBackupScript {
  choco export ".dotfiles\windows\choco-packages.json"
}

function PackageBackupScript {
  WingetBackupScript
  ScoopBackupScript
  ChocoBackupScript
}

function TouchFile {
  $file = $args[0]
  if ($null -eq $file) {
    throw "No filename supplied"
  }

  if (Test-Path $file) {
        (Get-ChildItem $file).LastWriteTime = Get-Date
  }
  else {
    Write-Output $null > $file
  }
}

function copyPath {
  (Get-Location).Path | Set-Clipboard
}

function LsAll {
  Get-ChildItem -Hidden
}

function wmstart { 
  komorebic start --whkd --bar 
}

function wmstop { 
  komorebic stop --whkd --bar 
}

function cat {
  bat
}

function dot {
  cd $dotfiles
}


# Powershell is case insensitive so we cannot have matching names and aliases even if the case is different
Set-Alias npi NpmIntall
Set-Alias nps NpmStart
Set-Alias npis NpmInstallStart
Set-Alias npb NpmBuild
Set-Alias npt NpmTest
Set-Alias lg lazygit
Set-Alias -Name WingetBackup -Value WingetBackupScript
Set-Alias -Name ScoopBackup -Value ScoopBackupScript
Set-Alias -Name ChocoBackup -Value ChocoBackupScript
Set-Alias -Name PackageBackup -Value PackageBackupScript
Set-Alias touch TouchFile
Set-Alias lsa LsAll
