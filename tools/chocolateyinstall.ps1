$ErrorActionPreference = 'Stop'; 

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/3/7/D/37D90824-1BE8-4085-920E-54812C045A55/microsoft.interopformsredist.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'interopformsredist*' 

  # Checksums are now required as of 0.10.0.
  #
  checksum      = 'a1f643c82c1be0ecaad920e5c1c11bb0006403788aa733212a6359d76f850399'
  checksumType  = 'sha256' 


  # Cygwin $env:TEMP is C:\tools\cygwin\tmp\chocolatey
  # Powershell $env:TEMP is C:\Users\tanner\AppData\Local\Temp
  #
  # msiexec /i "\\server\Deploy\SYSPRO\ISSetupPrerequisites\ {58E08727-9947-4FC4-BA00-9C3B80A5DAF6}\microsoft.interopformsredist.msi" /qb
  #
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 
