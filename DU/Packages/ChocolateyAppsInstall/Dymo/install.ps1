if (!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
  Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
$ChocoPackages = @("dymo-label")
foreach($Package in $ChocoPackages) {
     try {
         Invoke-Expression �cmd.exe /c c:\ProgramData\Chocolatey\choco.exe Install $Package -y� -ErrorAction Stop
     }
     catch {
         Throw �Failed to install $Package�
     }
}

New-Item -Path "c:\" -Name "temp" -ItemType "directory" -force
$path = "c:\temp"
New-Item -path $path -name "chocodymo-label.txt" -ItemType file -force
