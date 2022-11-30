Write-Output "installing dependencies"

# test if ffmpeg is installed
if (Get-Command ffmpeg -ErrorAction SilentlyContinue) {
    Write-Output "ffmpeg is installed"
    exit
} else {
    Write-Output "ffmpeg is not installed"
}
#testchange3

Write-Output "ffmpeg"
$downloadUrl = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"
$outfile = "ffmpeg.zip"
#detect if files already exist
if (Test-Path $outfile) {
    Write-Output "ffmpeg already downloaded"
} else {
    Write-Output "downloading ffmpeg"
    Invoke-WebRequest -Uri $downloadUrl -OutFile $outfile
}
Expand-Archive ffmpeg.zip -DestinationPath .

$ffmpegdir = Join-Path $PSScriptRoot ffmpeg-
# get the name of the folder
$ffmpegFolder = Get-ChildItem -Path $ffmpegdir* | Select-Object -ExpandProperty Name

Write-Output $ffmpegFolder

$ffmpegpath = Join-Path $PSScriptRoot $ffmpegFolder

Write-Output $ffmpegpath

#mv to user/ffmpeg folder
$newpath = Join-Path $env:USERPROFILE $ffmpegFolder

Write-Output $newpath

Move-Item $ffmpegpath $newpath

# add ffmpeg to the path
function Add-Path($Path) {
    $Path = [Environment]::GetEnvironmentVariable("PATH", "User") + [IO.Path]::PathSeparator + $Path
    [Environment]::SetEnvironmentVariable( "Path", $Path, "User" )
}
$binfolder = Join-Path $newpath bin

Add-Path $binfolder

# after running script make sure to reload powershell for vscode with "Debug: restart" in command pallete