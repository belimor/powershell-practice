# Error Handling
#

try {
    # Code that may fail
    Get-Content -Path "nonexistentfile.txt"
} catch {
    # Handle the error
    Write-Host "An error occurred: $_"
}

