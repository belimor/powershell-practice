# Pipeline
#
# (Windows only??)

# Filter Services that are Running
Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object Name, Status

