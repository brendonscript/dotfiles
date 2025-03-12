# PowerShell version of install-standalone script

# Enable strict mode
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Configuration variables
$BASE_CONFIG = "base"
$CONFIG_SUFFIX = ".yaml"

$META_DIR = "meta"
$CONFIG_DIR = "configs"

$DOTBOT_DIR = "dotbot"
$DOTBOT_BIN = "bin/dotbot"

# Get the base directory (equivalent to $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd))
$BASE_DIR = $PSScriptRoot

# Change to the base directory
Set-Location $BASE_DIR

# Update git submodules
git submodule update --init --recursive --remote

# Process each config passed as arguments
foreach ($config in $args) {
    Write-Host "`nConfigure $config" -ForegroundColor Cyan
    
    # Read the base and specific config files
    $baseConfigPath = Join-Path $BASE_DIR $META_DIR "$BASE_CONFIG$CONFIG_SUFFIX"
    $specificConfigPath = Join-Path $BASE_DIR $META_DIR $CONFIG_DIR "$config$CONFIG_SUFFIX"
    
    if (-not (Test-Path $specificConfigPath)) {
        Write-Warning "Config file for '$config' not found. Skipping."
        continue
    }
    
    $baseContent = Get-Content $baseConfigPath -Raw
    $specificContent = Get-Content $specificConfigPath -Raw
    $configContent = "$baseContent`n$specificContent"
    
    # Create a temporary file for the combined config
    $tempFile = New-TemporaryFile
    $configContent | Set-Content $tempFile -NoNewline
    
    # Run dotbot
    $dotbotPath = Join-Path $BASE_DIR $META_DIR $DOTBOT_DIR $DOTBOT_BIN
    
    # Use python to run dotbot (similar to the bash script)
    # Try different versions of python
    $pythonCommands = @("python", "python3", "python2")
    $success = $false
    
    foreach ($pythonCmd in $pythonCommands) {
        try {
            # Check if python command is available
            $null = & $pythonCmd --version 2>&1
            
            # Run dotbot with the python command
            & $pythonCmd $dotbotPath -d $BASE_DIR -c $tempFile
            $success = $true
            break
        } catch {
            # Python command failed, try the next one
            continue
        }
    }
    
    # Clean up the temporary file
    Remove-Item $tempFile -Force
    
    if (-not $success) {
        Write-Error "Error: Cannot find Python."
        exit 1
    }
}
