param(
    [string]$PythonExe = "C:/Users/danil/AppData/Local/Microsoft/WindowsApps/python3.13.exe"
)

$ErrorActionPreference = "Stop"

Write-Host "[1/4] Using Python executable: $PythonExe"
& $PythonExe --version

Write-Host "[2/4] Upgrading pip and installing required packages"
& $PythonExe -m pip install --user --upgrade pip
& $PythonExe -m pip install --user -r requirements.txt

Write-Host "[3/4] Verifying imports (docopt, scipy, numpy, csv, graphviz)"
& $PythonExe -c "import docopt, scipy, numpy, csv, graphviz; print('ok')"

Write-Host "[4/4] Done"
