# Check if the PowerShell profile file exists
$profilePath = $profile
if (-not(Test-Path -Path $profilePath)) {
    # If the profile file doesn't exist, create it
    New-Item -Path $profilePath -Type File -Force > $null
}

# Add the necessary lines to the PowerShell profile file
Add-Content -Path $profilePath -Value @"
Set-PSReadLineOption -EditMode Emacs
"@
