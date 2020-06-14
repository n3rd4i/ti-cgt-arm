$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/18.1.4.LTS/ti_cgt_tms470_18.1.4.LTS_windows_installer.exe'
  softwareName  = 'ti_cgt_tms470*'
  checksum      = 'F55B7D78174F09A51C6A4B181EA515CA'
  checksumType  = 'md5'
  silentArgs    = '--prefix "c:\ti\ccs901\ccs\tools\compiler" --unattendedmodeui none --mode unattended'
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
