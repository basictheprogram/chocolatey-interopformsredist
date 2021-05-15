$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  silentArgs    = "/qn /norestart"
  url           = ''
  softwareName  = 'interopformsredist*'

  checksum      = 'a1f643c82c1be0ecaad920e5c1c11bb0006403788aa733212a6359d76f850399'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
