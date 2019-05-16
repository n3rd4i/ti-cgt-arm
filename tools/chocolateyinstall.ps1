$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/18.1.4.LTS/ti_cgt_tms470_18.1.4.LTS_windows_installer.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url           = $url
  softwareName  = 'ti_cgt_tms470*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = 'F55B7D78174F09A51C6A4B181EA515CA'
  checksumType  = 'md5' #default is md5, can also be sha1, sha256 or sha512
  silentArgs    = '--prefix "c:\ti\ccs901\ccs\tools\compiler" --unattendedmodeui none --mode unattended'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
