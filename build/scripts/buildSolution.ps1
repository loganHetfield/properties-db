param( [string] $projectFile,
       [string] $target = "Build",
       [string] $configuration = "Release",
       [string] $platform = "Any CPU",
       [string] $properties,
       [string] $outputPath,
       [string] $msbuildExe = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe",
	   [string] $verbosity,
       $maxcpu = $true )

if ( !$msbuildExe )
{
	throw ("Aborting operation`: `$msbuildExe is a required. Verify that your settings files are properly configured."); 
}

if ( !$projectFile )
{
	throw ("Aborting operation`: `$projectFile is a required. Verify that your settings files are properly configured."); 
}

if( !( test-path $msbuildExe ) )
{
    $msbuildExe = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe"
    if( !( test-path $msbuildExe ) )
    {
        write-error "Aborting operation`: Unable to locate msbuild.exe"
        exit 1
    }   
}

if( !( test-path $projectFile ) )
{
    write-error "Aborting operation`: Unable to locate project file $projectFile"
    exit 1
}

if( $verbosity -ne "" )
{
	$verbosity = "-verbosity:$verbosity"
}

$propertiesArg = '"-property:Configuration='
$propertiesArg += $configuration
if( $platform -ne "" )
{
    $propertiesArg += ";Platform=$platform"
}

if( $outputPath -ne "" )
{
    if( !( Test-Path( $outputPath ) ) ){ mkdir $outputPath } 
    $outputPath = ( Resolve-Path $outputPath ).Path
    $propertiesArg += ";OutputPath=$outputPath"
}

if( $properties -ne "" )
{
    $propertiesArg += ";$properties"
}

$maxcpuArg = ""

if( $maxcpu )
{
    $maxcpuArg = " -m "
}

write-host -NoNewline -ForegroundColor DarkGray "Building "
write-host -NoNewline -ForegroundColor DarkBlue "$projectFile"
write-host -NoNewline -ForegroundColor DarkGray "; Target: "
write-host -NoNewline -ForegroundColor DarkBlue "$target"
write-host -NoNewline -ForegroundColor DarkGray "; Configuration: "
write-host -NoNewline -ForegroundColor DarkBlue "$configuration"
write-host -NoNewline -ForegroundColor DarkGray "; OutputPath: "
write-host -NoNewline -ForegroundColor DarkBlue "$outputPath"
write-host -NoNewline -ForegroundColor DarkGray "; Properties = ["
write-host -NoNewline -ForegroundColor DarkBlue "$properties"
write-host -ForegroundColor DarkGray "]"

Write-Host -NoNewline -ForegroundColor DarkGray "Executing commandline: "
Write-Host -NoNewline -ForegroundColor DarkBlue "$msbuildExe $projectFile $additionalSwitches -target:$target -m $propertiesArg -maxcpucount"

. $msbuildExe $projectFile $additionalSwitches -target:$target $propertiesArg $maxcpuArg #-maxcpucount #maxcpucout with no parameter will tell msbuild to use all procs

$success = $?
write-host -NoNewline -ForegroundColor DarkGray "Building "
write-host -NoNewline -ForegroundColor DarkBlue "$projectFile"
Write-Host -NoNewline -ForegroundColor DarkBlue "Vebosity: "
Write-Host -NoNewline -ForegroundColor DarkBlue "$verbosity"
write-host -NoNewline -ForegroundColor DarkGray "; Target: "
write-host -NoNewline -ForegroundColor DarkBlue "$target"
write-host -NoNewline -ForegroundColor DarkGray "; Configuration: "
write-host -NoNewline -ForegroundColor DarkBlue "$configuration"
write-host -NoNewline -ForegroundColor DarkGray "; OutputPath: "
write-host -NoNewline -ForegroundColor DarkBlue "$outputPath"
write-host -NoNewline -ForegroundColor DarkGray "; Properties = ["
write-host -NoNewline -ForegroundColor DarkBlue "$properties"
write-host -NoNewline -ForegroundColor DarkGray "] : "
if( $success )
{
    write-host -ForegroundColor DarkBlue "complete"
}else
{
    write-host -ForegroundColor DarkRed "failed"
    exit 1
}