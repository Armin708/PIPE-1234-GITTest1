# scripts/hooks/common.ps1
# Gemeinsame Funktionen für alle Hooks

function Get-BranchName {
    # Liefert den aktuellen Git-Branch-Namen
    $branch = git rev-parse --abbrev-ref HEAD
    return $branch.Trim()
}

function Get-TicketIdFromBranch {
    # Extrahiert eine Ticket-ID (z.B. CRM-123) aus dem Branch-Namen
    $branch = Get-BranchName
    if ($branch -match '([A-Z]+-\d+)') {
        return $matches[1]
    }
    return $null
}

function Get-AppVersion {
    # Liest Version aus app.json
    $appJsonPath = "app.json"
    if (Test-Path $appJsonPath) {
        $json = Get-Content $appJsonPath -Raw | ConvertFrom-Json
        return $json.version
    }
    return $null
}

function Write-Info($msg) {
    Write-Host "[INFO] $msg" -ForegroundColor Cyan
}

function Write-ErrorMsg($msg) {
    Write-Host "[ERROR] $msg" -ForegroundColor Red
}