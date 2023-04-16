param(
    [string]$filename
)

# Attempt to automatically locate the CSGO install folder and set the output destination.
$regPath = "HKLM:\SOFTWARE\Wow6432Node\Valve\Steam"
$regValue = "InstallPath"
$steamPath = (Get-ItemProperty $regPath).$regValue
$demoPath = Join-Path $steamPath "steamapps\common\Counter-Strike Global Offensive\csgo"

# The above may fail if your CSGO is located within a non-standard directory.
# Modify the $demoPath variable below to your CSGO install directory.
# Remove the hashtag as it denotes a comment!

# $demoPath = "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo"

if ($demoPath -eq $null) {
    Write-Host "No demo destination path found. Have you tried modifying the script with your path?"
    Exit
}

# Set the source directory to the Downloads folder
$sourceDir = "$env:USERPROFILE\Downloads"

# Get the most recently downloaded .dem.gz file
$latestFile = Get-ChildItem $sourceDir -Filter "*.dem.gz" | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 1

# Check if a .dem file was found
if ($latestFile -eq $null) {
    Write-Host "No .dem.gz file found in $sourceDir"
    Exit
}

# Move the file to the destination directory
if (!(Test-Path $demoPath)) {
    New-Item -ItemType Directory -Path $demoPath | Out-Null
}

Move-Item -Path $latestFile.FullName -Destination "$demoPath\$filename.dem" -Force
Write-Host "Moved $latestFile to $demoPath\$filename.dem"
