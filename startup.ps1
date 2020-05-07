[Net.ServicePointManager]::SecurityProtocol = 'tls13, tls12, tls11, tls'

Write-Host 'Downloading Chrome Remote Desktop.'
$installer = "$env:TEMP\chromeremotedesktophost.msi"
Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' `
    -OutFile $installer
Write-Host 'Installing Chrome Remote Desktop.'
& msiexec.exe /I $installer /qn /quiet | Out-Default
Remove-Item $installer

$installer = "$env:TEMP\chrome_installer.exe"
Write-Host 'Downloading Chrome.'
Invoke-WebRequest  'https://dl.google.com/chrome/install/latest/chrome_installer.exe' `
    -OutFile $installer
Write-Host 'Installing Chrome.'
& $installer /silent /install | Out-Default
Remove-Item $installer

Write-Host 'Starting Chrome Remote Desktop service.'
& "${env:ProgramFiles(x86)}\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe" `
    $codeArg $redirectArg --name="windows-server" -pin="123456" | Out-Default

