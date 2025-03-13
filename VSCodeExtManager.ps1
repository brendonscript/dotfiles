# VS Code Extension Manager

# Ensure VS Code CLI is available
if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
    Write-Host "VS Code CLI not found. Ensure it's installed and in your PATH." -ForegroundColor Red
    exit 1
}

function Show-Menu {
    param (
        [string[]]$Items
    )

    $selectedIndices = @{}
    $currentIndex = 0
    $totalItems = $Items.Count

    # Display function
    function Render-Menu {
        Clear-Host
        Write-Host "VS Code Extension Manager" -ForegroundColor Cyan
        Write-Host "Space: select/deselect, Ctrl+T: toggle all, Enter: confirm" -ForegroundColor DarkGray
        Write-Host ""

        for ($i = 0; $i -lt $totalItems; $i++) {
            $prefix = if ($selectedIndices.ContainsKey($i)) { "[x]" } else { "[ ]" }
            $color = if ($i -eq $currentIndex) { "Yellow" } else { "White" }
            Write-Host "$prefix $($Items[$i])" -ForegroundColor $color
        }
    }

    # Initial render
    Render-Menu

    # Handle keyboard input
    while ($true) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

        switch ($key.VirtualKeyCode) {
            38 { # Up arrow
                if ($currentIndex -gt 0) { $currentIndex-- }
                Render-Menu
            }
            40 { # Down arrow
                if ($currentIndex -lt $totalItems - 1) { $currentIndex++ }
                Render-Menu
            }
            32 { # Space
                if ($selectedIndices.ContainsKey($currentIndex)) {
                    $selectedIndices.Remove($currentIndex)
                } else {
                    $selectedIndices[$currentIndex] = $true
                }
                Render-Menu
            }
            13 { # Enter
                return $selectedIndices.Keys | ForEach-Object { $Items[$_] }
            }
            27 { # Escape
                return @()
            }
            20 { # Ctrl+T (T has VirtualKeyCode 84, Ctrl+T is 20)
                if ($selectedIndices.Count -eq $totalItems) {
                    $selectedIndices.Clear()
                } else {
                    for ($i = 0; $i -lt $totalItems; $i++) {
                        $selectedIndices[$i] = $true
                    }
                }
                Render-Menu
            }
        }
    }
}

# Get installed extensions
Write-Host "Fetching installed extensions..." -ForegroundColor Cyan
$extensions = code --list-extensions

if ($extensions.Count -eq 0) {
    Write-Host "No extensions installed." -ForegroundColor Yellow
    exit 0
}

# Show menu and get selection
$selected = Show-Menu -Items $extensions

# Exit if nothing selected
if ($selected.Count -eq 0) {
    Write-Host "No extensions selected for uninstallation." -ForegroundColor Yellow
    exit 0
}

# Display selected extensions
Write-Host "`nSelected extensions ($($selected.Count)):" -ForegroundColor Cyan
$selected | ForEach-Object { Write-Host "  - $_" -ForegroundColor White }

# Confirm before uninstalling
$confirm = Read-Host "`nProceed with uninstallation? (y/N)"
if ($confirm -notmatch "^[Yy]$") {
    Write-Host "Uninstallation cancelled." -ForegroundColor Yellow
    exit 0
}

# Track results
$success = 0
$failed = 0

# Uninstall each selected extension
Write-Host "`nUninstalling extensions..." -ForegroundColor Cyan
foreach ($extension in $selected) {
    Write-Host "  $extension ... " -NoNewline
    
    try {
        $output = code --uninstall-extension $extension 2>&1
        Write-Host "Success" -ForegroundColor Green
        $success++
    } catch {
        Write-Host "Failed" -ForegroundColor Red
        $failed++
    }
}

# Display summary
Write-Host "`nComplete: $success succeeded, $failed failed." -ForegroundColor Cyan
