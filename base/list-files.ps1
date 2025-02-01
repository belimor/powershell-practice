# List Files in the Directory
#

Get-ChildItem -Path ./ | Out-File list_of_files.txt

$content = Get-Content -Path list_of_files.txt
Write-Host $content
