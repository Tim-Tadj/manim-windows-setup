#check if python is installed
if (Get-Command python -ErrorAction SilentlyContinue) {

} else {
    Write-Host "Python is not installed"
    # exit the script
    exit
}

#check if pip is installed
if (Get-Command pip -ErrorAction SilentlyContinue) {

} else {
    Write-Host "pip is not installed"
    # exit the script
    exit
}

# if conda is installed, deactivate it
if (Get-Command conda -ErrorAction SilentlyContinue) {
    conda deactivate
}

# get number of args
$argCount = $args.Count
# if 1 arg is passed, it is the path to the manim folder
if ($argCount -eq 0) {
    $manimPath = "manim-projects"
    Write-Host "manim path: $manimPath"
} elseif ($argCount -eq 1) {
    $manimPath = $args[0]
    Write-Host "manim path: $manimPath"
} else {
    Write-Host "too many args"
    exit
}
#get path of running script
$scriptPath = $MyInvocation.MyCommand.Path
# get the directory of the script
$scriptDir = Split-Path $scriptPath

# make a new folder for manim
if (Test-Path $manimPath) {
    Write-Host "manim folder already exists"
    Set-Location $scriptDir/$manimPath
} else {
    Write-Host "creating manim folder"
    New-Item -ItemType Directory -Path $scriptDir/$manimPath
    Set-Location $scriptDir/$manimPath
}

# create a virtual environment with pip
python -m venv .venv 

# activate the virtual environment
./.venv/Scripts/Activate.ps1

#install manim
pip install manim

# move create-new-proj.ps1 to the manim folder
Move-Item $scriptDir/create-new-proj.ps1 $scriptDir/$manimPath
