function Install-Choco
{
    <#
      .SYNOPSIS
      Installs Chocolatey package manager into the system.

      .DESCRIPTION
      Installs Chocolatey package manager into the system with the default chocolatey installation script. Environmental variable is updated in order to use choco without console restart.

      .EXAMPLE
      Install-Choco
      Installs Chocolatey package manager, updates environmental variable to use choco without console restart.

      .EXAMPLE
      Import-Module Choco; Install-Choco
      Imports this module and installs Chocolatey package manager, updates environmental variable to use choco without console restart.

      .EXAMPLE
      Import-Module Choco; ich
      Imports this module and installs Chocolatey package manager, updates environmental variable to use choco without console restart.

      .NOTES
      - This function uses the standard way how to install Chocolatey package manager from chocolatey.org.
      - This function requires admin privileges to work properly.

      .LINK
      https://github.com/KUTlime/PowerShell-Choco-Module

      .INPUTS

      .OUTPUTS
      An installed choco package manager, ready to use without restart console.
    #>
    [CmdletBinding()]
    [Alias("ich")]
    [Alias("instch")]
    Param ()
    if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process powershell.exe "-NoProfile -NoLogo -Command `"InstCh;pause`"" -Verb RunAs; exit}
    Write-Host "[Choco installation module] Installing Chocolatey..." -ForegroundColor:Cyan
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
    Write-Host "[Choco installation module] Chocolatey installation has been completed. Try type: 'choco search firefox' for verification.`n" -ForegroundColor:Cyan
    Write-Host "[Choco installation module] If verification is successful, you can run 'Uninstall-Module Choco' to remove this module from your system." -ForegroundColor:Cyan
}