$configDirectory = "$HOME\Documents\Powershell"
$ENV:EDITOR = "code"
$ENV:VISUAL = "code"
# $env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin;C:\Program Fiels\Git\usr\bin"
$env:Path += ";C:\Program Fiels\Git\usr\bin"
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"

. "$configDirectory\Aliases.ps1"
. "$configDirectory\CustomModules.ps1"
. "$configDirectory\Zoxide.ps1"
. "$configDirectory\Completions\Wezterm.ps1"

# Set-PSReadLineOption -EditMode vi
# Set-PSReadLineKeyHandler -Key 'j,k' -ViMode Insert -Function ViCommandMode
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -BellStyle None

function OnViModeChange {
  if ($args[0] -eq 'Command') {
    # Set the cursor to a blinking block.
    Write-Host -NoNewLine "`e[1 q"
  }
  else {
    # Set the cursor to a blinking line.
    Write-Host -NoNewLine "`e[5 q"
  }
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange

Invoke-Expression (&starship init powershell)