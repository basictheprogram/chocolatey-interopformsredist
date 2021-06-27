$ErrorActionPreference = 'Stop';

$data = & (Join-Path -Path (Split-Path -Path $MyInvocation.MyCommand.Path) -ChildPath data.ps1)
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    fileType      = 'msi'
    silentArgs    = "/qn /norestart"
    softwareName  = 'interopformsredist'

    url           = $data.url
    checksum      = $data.checksum
    checksumType  = $data.checksumType
}

Install-ChocolateyPackage @packageArgs
