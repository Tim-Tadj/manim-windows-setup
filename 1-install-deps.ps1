Write-Output "installing dependencies"

# test if ffmpeg is installed
if (Get-Command ffmpeg -ErrorAction SilentlyContinue) {
    Write-Output "ffmpeg is installed"
    exit
} else {
    Write-Output "ffmpeg is not installed"
}
#testchange

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
Expand-Archive ffmpeg.zip -DestinationPath C:\
# get the name of the folder
$ffmpegFolder = Get-ChildItem -Path C:\ffmpeg* | Select-Object -ExpandProperty Name
# rename the folder
Rename-Item -Path C:\$ffmpegFolder -NewName ffmpeg
# add ffmpeg to the path
function Add-Path($Path) {
    $Path = [Environment]::GetEnvironmentVariable("PATH", "User") + [IO.Path]::PathSeparator + $Path
    [Environment]::SetEnvironmentVariable( "Path", $Path, "User" )
}

Add-Path "C:\ffmpeg\bin"