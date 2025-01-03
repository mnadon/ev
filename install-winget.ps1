# Check if winget is already installed
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    # Download the latest App Installer package
    $installerUrl = "https://aka.ms/getwinget"
    $installerPath = "$env:TEMP\AppInstaller.msixbundle"

    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

    # Add-AppxPackage requires admin privileges
    Start-Process powershell -ArgumentList "Add-AppxPackage -Path $installerPath" -Verb RunAs
} else {
    Write-Output "winget is already installed."
}