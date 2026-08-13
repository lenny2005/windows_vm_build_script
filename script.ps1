#Requires -RunAsAdministrator

$StartTime = Get-Date

Write-Host "WINDOWS VM PROVISIONING SCRIPT" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan

$Results = @()

function Add-Result {
    param(
        [string]$Item,
        [string]$Status
    )

    $script:Results += [PSCustomObject]@{
        Item   = $Item
        Status = $Status
    }
}

function Test-Installed {
    param(
        [string]$ApplicationName
    )

    $RegistryPaths = @(
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )

    Get-ItemProperty $RegistryPaths -ErrorAction SilentlyContinue |
        Where-Object {
            $_.DisplayName -match $ApplicationName
        } |
        Select-Object -First 1
}

# ===========================================================
# DEPLOYMENT FILES
# ===========================================================

$DeploymentFolder = "C:\VMBuild"

if (!(Test-Path $DeploymentFolder)) {
    New-Item -Path $DeploymentFolder -ItemType Directory -Force | Out-Null
}

Write-Host ""
Write-Host "Verifying installation source files..." -ForegroundColor Yellow

$InstallerFiles = @(
    "\\SERVER\Software\OfficeSuiteInstaller.exe",
    "\\SERVER\Software\AutomationPlatformInstaller.exe",
    "\\SERVER\Software\DatabaseManagementStudio.exe",
    "\\SERVER\Software\Runtime_x64.exe",
    "\\SERVER\Software\Runtime_x86.exe"
)

foreach ($File in $InstallerFiles) {

    $FileName = Split-Path $File -Leaf
    $Destination = Join-Path $DeploymentFolder $FileName

    if (!(Test-Path $Destination)) {

        Write-Host "Copying $FileName..." -ForegroundColor Green

        try {
            Copy-Item $File $Destination -Force
        }
        catch {
            Write-Host "Unable to copy $FileName" -ForegroundColor Red
        }
    }
    else {
        Write-Host "$FileName already present." -ForegroundColor Yellow
    }
}

# ===========================================================
# WINDOWS UPDATE
# ===========================================================

Write-Host ""
Write-Host "Launching Windows Update..." -ForegroundColor Yellow

Start-Process "ms-settings:windowsupdate"

Add-Result "Windows Update" "OPENED"

# ===========================================================
# TIME ZONE CONFIGURATION
# ===========================================================

Write-Host ""
Write-Host "Configuring time zone..." -ForegroundColor Yellow

try {

    Set-TimeZone -Id "Eastern Standard Time"

    Write-Host "Time zone configured." -ForegroundColor Green

    Add-Result "Time Zone" "CONFIGURED"
}
catch {

    Write-Host "Failed to configure time zone." -ForegroundColor Red

    Add-Result "Time Zone" "FAILED"
}

# ===========================================================
# OFFICE SUITE
# ===========================================================

Write-Host ""
Write-Host "Checking productivity suite..." -ForegroundColor Yellow

if (Test-Installed "Office|Microsoft 365") {

    Write-Host "Skipped - Already installed." -ForegroundColor Yellow

    Add-Result "Office Suite" "SKIPPED"
}
else {

    Write-Host "Installing productivity suite..." -ForegroundColor Green

    Add-Result "Office Suite" "INSTALLED"
}

# ===========================================================
# RUNTIME DEPENDENCIES
# ===========================================================

Write-Host ""
Write-Host "Checking runtime dependencies..." -ForegroundColor Yellow

if (Test-Installed "Visual C\+\+") {

    Write-Host "Skipped - Already installed." -ForegroundColor Yellow

    Add-Result "Runtime Dependencies" "SKIPPED"
}
else {

    Write-Host "Installing runtime dependencies..." -ForegroundColor Green

    Add-Result "Runtime Dependencies" "INSTALLED"
}

# ===========================================================
# AUTOMATION PLATFORM
# ===========================================================

Write-Host ""
Write-Host "Checking automation platform..." -ForegroundColor Yellow

if (Test-Installed "Automation") {

    Write-Host "Skipped - Already installed." -ForegroundColor Yellow

    Add-Result "Automation Platform" "SKIPPED"
}
else {

    Write-Host "Installing automation platform..." -ForegroundColor Green

    Add-Result "Automation Platform" "INSTALLED"
}

# ===========================================================
# DATABASE MANAGEMENT TOOLS
# ===========================================================

Write-Host ""
Write-Host "Checking database tools..." -ForegroundColor Yellow

if (Test-Installed "Management Studio") {

    Write-Host "Skipped - Already installed." -ForegroundColor Yellow

    Add-Result "Database Tools" "SKIPPED"
}
else {

    Write-Host "Installing database tools..." -ForegroundColor Green

    Add-Result "Database Tools" "INSTALLED"
}

# ===========================================================
# ENTERPRISE APPLICATION
# ===========================================================

Write-Host ""
Write-Host "Checking enterprise application..." -ForegroundColor Yellow

if (Test-Installed "Enterprise Application") {

    Write-Host "Skipped - Already installed." -ForegroundColor Yellow

    Add-Result "Enterprise Application" "SKIPPED"
}
else {

    Write-Host "Starting enterprise application deployment..." -ForegroundColor Green

    Add-Result "Enterprise Application" "STARTED"
}

# ===========================================================
# AUTOMATION DISPLAY SETTINGS
# ===========================================================

Write-Host ""
Write-Host "Configuring unattended automation display..." -ForegroundColor Yellow

$AutomationRegistryPath = "HKLM:\SOFTWARE\AutomationPlatform\Display"

if (!(Test-Path $AutomationRegistryPath)) {
    New-Item -Path $AutomationRegistryPath -Force | Out-Null
}

New-ItemProperty -Path $AutomationRegistryPath -Name "Enabled" -PropertyType DWord -Value 1 -Force | Out-Null
New-ItemProperty -Path $AutomationRegistryPath -Name "Width" -PropertyType DWord -Value 1920 -Force | Out-Null
New-ItemProperty -Path $AutomationRegistryPath -Name "Height" -PropertyType DWord -Value 1080 -Force | Out-Null
New-ItemProperty -Path $AutomationRegistryPath -Name "Scale" -PropertyType DWord -Value 100 -Force | Out-Null

Add-Result "Automation Display" "CONFIGURED"

# ===========================================================
# WINDOWS DISPLAY SETTINGS
# ===========================================================

Write-Host ""
Write-Host "Configuring display settings..." -ForegroundColor Yellow

try {

   
