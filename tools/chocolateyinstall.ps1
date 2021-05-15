$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  silentArgs    = "/qn /norestart"
  url           = 'http://gold-images.int.celadonsystems.com/SYSPRO/SYSPRO7_Update1_2016 - Lucy/SYSPRO/ISSetupPrerequisites/{58E08727-9947-4FC4-BA00-9C3B80A5DAF6}/microsoft.interopformsredist.msi'
  softwareName  = 'interopformsredist*'

  checksum      = 'a1f643c82c1be0ecaad920e5c1c11bb0006403788aa733212a6359d76f850399'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
