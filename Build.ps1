param(
    [string]$version="1.0.0",
    [string]$AppName    
)



$msbuild = "C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe"
$current =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$projectFilePath = join-path $current "\Web_1\Web_1.csproj"

if ( -not ( Test-Path ".\Build") )
{
    mkdir ".\Build"
}

Remove-Item .\Build\* -recurse -Force

& $msbuild $projectFilePath /t:Build /p:Configuration=Release /p:DeployOnBuild=True /p:PublishProfile=Release
