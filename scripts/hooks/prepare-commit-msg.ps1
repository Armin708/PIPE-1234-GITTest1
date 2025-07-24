#!/usr/bin/env pwsh
. "$(Split-Path $MyInvocation.MyCommand.Path -Parent)\common.ps1"

# Argumente: commit_msg_file [commit_source] [sha1]
param(
    [string]$CommitMsgFile,
    [string]$Source = "",
    [string]$SHA1 = ""
)

Write-Info "Running prepare-commit-msg hook..."

$ticketId = Get-TicketIdFromBranch
if ($ticketId) {
    $currentMsg = Get-Content $CommitMsgFile
    if ($currentMsg -notmatch "\[$ticketId\]") {
        Write-Info "Adding Ticket-ID [$ticketId] to commit message"
        Set-Content -Path $CommitMsgFile -Value "[$ticketId] $currentMsg"
    }
} else {
    Write-Info "No Ticket-ID found in branch name"
}