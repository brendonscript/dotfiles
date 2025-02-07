
function Install-ModuleIfNotInstalled {
  param (
    [string]$ModuleName
  )

  if (-not (Get-Module -Name $ModuleName -ListAvailable)) {
    Write-Host "$ModuleName module not found. Installing..."
    Install-Module -Name $ModuleName -Scope CurrentUser -Force
  }
}

# Modules to be installed
# $modulesToInstall = @("posh-git", "git-aliases", "PsReadline", "Microsoft.WinGet.CommandNotFound")
$modulesToInstall = @("git-aliases", "PsReadline", "Microsoft.WinGet.CommandNotFound")

foreach ($module in $modulesToInstall) {
  Install-ModuleIfNotInstalled -ModuleName $module
}

# Import the installed modules
foreach ($module in $modulesToInstall) {
  Import-Module $module -DisableNameChecking
}

