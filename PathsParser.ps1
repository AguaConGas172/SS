$GitHubUrl = "https://github.com/spokwn/PathsParser/releases/download/v1.0.11/PathsParser.exe"
$DownloadPath = "$env:USERPROFILE\Downloads\PathsParser.exe"
$InstallPath = "C:\Program Files\PathsParser\PathsParser.exe"
Set-Location -Path "$env:USERPROFILE\Downloads"
Invoke-WebRequest -Uri $GitHubUrl -OutFile $DownloadPath
if (-not (Test-Path "C:\Program Files\PathsParser")) { New-Item -Path "C:\Program Files" -Name "PathsParser" -ItemType "Directory" }
if (Test-Path $InstallPath) { Remove-Item -Path $InstallPath -Force -ErrorAction SilentlyContinue }
Move-Item -Path $DownloadPath -Destination $InstallPath -ErrorAction SilentlyContinue
Start-Process -FilePath $InstallPath -Verb RunAs
while (Get-Process -Name "PathsParser" -ErrorAction SilentlyContinue) { Start-Sleep -Seconds 1 }
Remove-Item -Path $DownloadPath -Force -ErrorAction SilentlyContinue
