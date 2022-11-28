# get number of args
$argCount = $args.Count
# if 1 arg is passed, it is the path to the manim folder
if ($argCount -eq 0) {
    $manimName = "my_project"
    Write-Host "project path: $manimPath"
} elseif ($argCount -eq 1) {
    $manimName = $args[0]
    Write-Host "project path: $manimPath"
} else {
    Write-Host "too many args"
    exit
}

# check if folder already exists
if (Test-Path $manimName) {
    Write-Host "project folder already exists"
    exit
} else {
    
}

# check if manim is installed
if (Get-Command manim -ErrorAction SilentlyContinue) {
    Write-Host "manim is installed"
} else {
    Write-Host "manim is not installed"
    exit
}



# get path of running script
$scriptPath = $MyInvocation.MyCommand.Path
# get the directory of the script
$scriptDir = Split-Path $scriptPath
$activateDir = ".venv/Scripts/Activate.ps1"

# join the path to the activate script
$activatePath = Join-Path $scriptDir $activateDir

# activate the virtual environment
. $activatePath

$manimDir = ".venv/Scripts/manim.exe"

# join the path to the manim script
$manimPath = Join-Path $scriptDir $manimDir

# print manim name
Write-Host "manim name: $manimName"

# create a new project
. $manimPath init project $manimName 

