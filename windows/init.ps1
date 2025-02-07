$sshDir = "$HOME\.ssh"
$personalKey = "$sshDir\personal_rsa"
$workKey = "$sshDir\work_rsa"

# Ensure .ssh directory exists
if (!(Test-Path $sshDir)) {
    New-Item -ItemType Directory -Path $sshDir | Out-Null
}

# Start SSH agent if not running
if (-not (Get-Process -Name ssh-agent -ErrorAction SilentlyContinue)) {
    Start-Process ssh-agent -NoNewWindow -PassThru | Out-Null
}

# Prompt user for email and passphrase
$personalEmail = Read-Host "Enter email for personal SSH key"
$workEmail = Read-Host "Enter email for work SSH key"
$passphrase = Read-Host "Enter passphrase for SSH keys (leave empty for no passphrase)"

# Function to generate SSH key if it does not exist
function Generate-SshKey {
    param (
        [string]$keyPath,
        [string]$email,
        [string]$passphrase
    )
    if ([string]::IsNullOrEmpty($passphrase)) {
        ssh-keygen -t rsa -b 4096 -f $keyPath -N "" -C $email | Out-Null
    } else {
        ssh-keygen -t rsa -b 4096 -f $keyPath -N $passphrase -C $email | Out-Null
    }
}

# Check and generate keys if needed
if (!(Test-Path $personalKey)) {
    Write-Output "Generating personal SSH key..."
    Generate-SshKey -keyPath $personalKey -email $personalEmail -passphrase $passphrase
}

if (!(Test-Path $workKey)) {
    Write-Output "Generating work SSH key..."
    Generate-SshKey -keyPath $workKey -email $workEmail -passphrase $passphrase
}

# Add keys to SSH agent
ssh-add $personalKey
ssh-add $workKey

Write-Output "SSH keys setup complete."
