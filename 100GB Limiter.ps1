# Set the folder path to the directory where the script resides
$folderPath = $PSScriptRoot
$sizeLimitGB = 100  # Set your size limit here

# Convert size limit to bytes
$sizeLimitBytes = $sizeLimitGB * 1GB

# Get the script's file name to prevent self-deletion
$scriptName = [System.IO.Path]::GetFileName($PSCommandPath)

# Function to get folder size
function Get-FolderSize {
    param (
        [string]$path
    )
    return (Get-ChildItem -Path $path -Recurse -File | Measure-Object -Property Length -Sum).Sum
}

# Calculate the initial folder size
$folderSize = Get-FolderSize -path $folderPath

# Loop until the folder size is within the limit
while ($folderSize -gt $sizeLimitBytes) {
    # Get the oldest file in the folder and its subdirectories, excluding the script itself
    $oldestFile = Get-ChildItem -Path $folderPath -Recurse -File | Where-Object { $_.Name -ne $scriptName } | Sort-Object LastWriteTime | Select-Object -First 1
    
    # Check if there is any file to delete
    if ($null -ne $oldestFile) {
        # Delete the oldest file without confirmation or output
        Remove-Item -Path $oldestFile.FullName -Recurse -Force -Confirm:$false > $null 2>&1
        
        # Recalculate the folder size
        $folderSize = Get-FolderSize -path $folderPath
    } else {
        break
    }
}
