#!/usr/bin/env pwsh
. "$(Split-Path $MyInvocation.MyCommand.Path -Parent)\common.ps1"

Write-Info "Running pre-push hook..."

$version = Get-AppVersion
if (-not $version) {
    Write-ErrorMsg "No app.json version found. Aborting push."
    exit 1
}

Write-Info "Current app version: $version"
# Optional: Hier könnte man prüfen, ob Version hochgezählt wurde oder ob .app gebaut wurde.