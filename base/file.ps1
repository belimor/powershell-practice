# Create File
#
$filepath = "example.txt"
"Hello PowerShell" | Out-File -FilePath $filepath

# Read the File
#
$content = Get-Content -Path $filepath
Write-Host "File content: $content"

# Delete File
#
Remove-Item -Path $filepath
