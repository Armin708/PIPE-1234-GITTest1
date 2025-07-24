param([string]$commitMsgFile)

# Read commit message
$message = Get-Content $commitMsgFile -Raw

# Define regex pattern: TICKET-ID must be uppercase letters + number (e.g., CRM-123)
$pattern = '^[A-Z]+-\d+: .+'

if ($message -notmatch $pattern) {
    Write-Host "❌ Commit message is invalid!" -ForegroundColor Red
    Write-Host "Expected format: TICKETID: Description" -ForegroundColor Yellow
    Write-Host "Example: CRM-123: Fixed issue with posting" -ForegroundColor Yellow
    exit 1  # Abort commit
}

Write-Host "✅ Commit message format is valid." -ForegroundColor Green