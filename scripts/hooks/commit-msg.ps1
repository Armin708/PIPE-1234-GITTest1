#!/usr/bin/env pwsh
. "$(Split-Path $MyInvocation.MyCommand.Path -Parent)\common.ps1"

param([string]$CommitMsgFile)

Write-Info "Running commit-msg hook..."

$msg = Get-Content $CommitMsgFile -Raw
if ($msg.Length -lt 5) {
    Write-ErrorMsg "Commit message is too short."
    exit 1
}

if ($msg -notmatch '^\[[A-Z]+-\d+\]') {
    Write-ErrorMsg "Commit message must start with [TICKET-ID], e.g. [CRM-123]."
    exit 1
}