
param( [string] $sourcePath = '.',
       [string] $version = '1.0.0.0' )

if( !( test-path $sourcePath ) )
{
    write-error "Aborting operation`: Unable to locate source directory $sourcePath"
    exit 1
} 

if( $version -eq $null -or $version.Length -lt 7 )
{
    write-error "Aborting operation`: version argument is not valid: $version"
    exit 1
} 

$files = ls -path $sourcePath *AssemblyInfo.cs -recurse

Write-Host -NoNewline -ForegroundColor DarkGray "Updating assembly version information to: "
write-host -NoNewline -ForegroundColor DarkGreen $version
Write-Host -ForegroundColor DarkGray "`:"
$files | foreach -Process {
    $file = $_.Directory.ToString() + "\$_"
    write-host -NoNewline -ForegroundColor DarkGreen $file
    Write-Host -ForegroundColor DarkGray " -> "
    $content = get-content $file
    $updatedContent = @()
    foreach ( $line in $content ) {
        if( $line.Contains( "AssemblyVersion" ) -or
            $line.Contains( "AssemblyFileVersion" ) )
        {
            $match = $line -match "\d*\.\d*\.\d*\.\d*"
            if( $match )
            {
                $updatedContent += $line -replace "\d*\.\d*\.\d*\.\d*", $version
                $old = $Matches[0]
                Write-Host -NoNewline -ForegroundColor DarkGray "Replaced "
                write-host -NoNewline -ForegroundColor DarkGreen $old
                Write-Host -NoNewline -ForegroundColor DarkGray " with "
                write-host -ForegroundColor DarkGreen $version
            }
        }else
        {
            $updatedContent += $line
        }
    } 
    $updatedContent | set-content $file
}

Write-Host -ForegroundColor DarkGray "Updating version files complete."
