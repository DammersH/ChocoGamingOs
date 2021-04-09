#Preface for install script
param(
    [Parameter(Mandatory=$false)] $Messenger = $false,
    [Parameter(Mandatory=$false)] $OsBasics = $false,
    [Parameter(Mandatory=$false)] $GameClients = $false
)
#Checks if Chocolatey is installed
$ChocoInstalled = $false
if (Get-Command choco.exe -ErrorAction SilentlyContinue) {
    $ChocoInstalled = $true
}
#Installs Chocolatey if not. Command taken from chocolatey.org
if($ChocoInstalled -eq $false){
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

#Installs gaming related messenger
if($Messenger -eq $true){ <#TODO Check if $Messenger is sufficient#>
    choco install discord
#    TODO Anything else? TeamSpeak?
}

#Installs all known gaming clients (too much off them 🤮)
if($GameClients -eq $true){
    choco install steam-client
    choco install epicgameslauncher
    choco install origin
    choco install goggalaxy
    "Now installing the Steam remover"
    choco install steam-cleaner
}

#Installs _some_ necessary basics
if($OsBasics -eq $true){
    choco install firefox
    choco install googlechrome
    choco install nvidia-display-driver
    "Beware installing telemetry remover for nvidia"
    choco install disable-nvidia-telemetry
    "Have fun with THE powertoys"
    choco install powertoys
}
