
$executingScript = $MyInvocation.MyCommand.Path
$executingScriptPath = split-path $executingScript
$executingScriptName = $MyInvocation.MyCommand.Name
Write-Host -NoNewline -ForegroundColor DarkGray "script: "
Write-Host -ForegroundColor DarkGreen $executingScript
#Write-Host -NoNewline -ForegroundColor DarkGray "script path: "
#Write-Host -ForegroundColor DarkGreen $executingScriptPath

function removeExistingInstances()
{
    $t = $executingScript
    $module = $executingScript
    if( $target -is [system.IO.FileInfo] ) { $t = $_.FullName; $module = $_.Name }

    $module = [system.IO.Path]::GetFileNameWithoutExtension( $module )

    $modules = ( Get-Module $module ) | ? { $_.Path -ne $t }
    $modules | % {
        Write-Host -NoNewline -ForegroundColor DarkGray "Removing existing module implementation ["
        Write-Host -NoNewline -ForegroundColor DarkGreen $_.Name
        Write-Host -NoNewline -ForegroundColor DarkGray "@"
        Write-Host -NoNewline -ForegroundColor DarkGreen $_.Path
        Write-Host -NoNewline -ForegroundColor DarkGray "] "
        Remove-module $_
        Write-Host -ForegroundColor DarkGreen "complete"
    }
}

removeExistingInstances

function loadFromDirectory
{
    [CmdletBinding()]
    param( $target )

    Write-Host -NoNewline -ForegroundColor DarkGray "Loading modules from directory ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $target
    Write-Host -ForegroundColor DarkGray "]"
    $files = dir $target -Recurse
    $matches = New-Object "System.Collections.ArrayList"
    filterMatches $files $matches
    foreach( $file in $matches )
    {
        load $file.FullName -failOnInvalid $false
    }
}

function loadFromArchive
{
    [CmdletBinding()]
    param( $target )

    $packageName = [System.IO.Path]::GetFileNameWithoutExtension( $target )
    $destPath = join-path $unpackPath $packageName
    if( Test-Path $destPath )
    {
        $moduleName = [system.IO.path]::GetFileNameWithoutExtension( $target )
        Write-Host -NoNewline -ForegroundColor DarkGray "Expanded module ["
        Write-host -NoNewline -ForegroundColor DarkGreen $moduleName
        Write-host -NoNewline -ForegroundColor DarkGray "] found at ["
        Write-host -NoNewline -ForegroundColor DarkGreen $destPath
        Write-host -NoNewline -ForegroundColor DarkGray "]: "
        $existing = Get-Item $destPath
        $archive = Get-Item $target
        if( $archive.LastWriteTime -gt $existing.LastWriteTime )
        {
            Write-Host -ForegroundColor DarkGreen "archive is newer."
            rmdir $destPath -Force -Recurse > $null
        }
        else {
            Write-Host -ForegroundColor DarkGreen "expanded module is up-to-date."
            load $destPath -failOnInvalid $false; return;
        }
    }

    Write-Host -NoNewline -ForegroundColor DarkGray "Extracting module from archive ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $target
    Write-Host -ForegroundColor DarkGray "] "

    [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") > $null
    [System.IO.Compression.ZipFile]::ExtractToDirectory("$target", "$destPath")
    load $destPath -failOnInvalid $false
}

function loadTarget
{
    [CmdletBinding()]
    param( $target )

    Write-Host -NoNewline -ForegroundColor DarkGray "Loading module ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $target
    Write-Host -NoNewline -ForegroundColor DarkGray "] "

    $t = $target
    $module = $target
    if( $target -is [system.IO.FileInfo] ) { $t = $_.FullName; $module = $_.Name }

    $module = [system.IO.Path]::GetFileNameWithoutExtension( $module )

    $modules = ( Get-Module $module ) | ? { $_.Path -ne $t }
    $modules | % {
        Write-Host -NoNewline -ForegroundColor DarkGray "Removing existing module implementation ["
        Write-Host -NoNewline -ForegroundColor DarkGreen $_.Name
        Write-Host -NoNewline -ForegroundColor DarkGray "@"
        Write-Host -NoNewline -ForegroundColor DarkGreen $_.Path
        Write-Host -NoNewline -ForegroundColor DarkGray "] "
        Remove-module $_
        Write-Host -ForegroundColor DarkGreen "complete"
    }

    import-module $t -force -Global
    if( $? ) {
        Write-Host -NoNewline -ForegroundColor DarkGray "Loading module ["
        Write-Host -NoNewline -ForegroundColor DarkGreen $target
        Write-Host -NoNewline -ForegroundColor DarkGray "] "
        Write-Host -ForegroundColor DarkGreen "complete"
    }
    else { Write-Host -ForegroundColor DarkRed "failed"; exit 1; }
}

function load
{
    [CmdletBinding()]
    param( $target, $failOnInvalid = $true )

    if( ( test-path $target ) -and [system.IO.Directory]::Exists( $target ) )
    {
        loadFromDirectory $target
        return
    }

    switch -regex ( $target )
    {
        "\.ps[m|d]?1" { loadTarget $target }
        "\.zip" { loadFromArchive $target }
        default {
            if( $failOnInvalid )
            {
                Write-Host -NoNewline -ForegroundColor DarkRed "Unable to interpret '$target'";
                exit 1;
            }

            Write-Host -NoNewline -ForegroundColor DarkGray "Ignoring invalid module [";
            Write-Host -NoNewline -ForegroundColor DarkGreen "[$target]";
            Write-Host -ForegroundColor DarkGray "]";
        }
    }
}

function filterMatches
{
    param( $files, $matches )

    $psms = $files | where { $_.Extension -eq ".psm1" }
    $psmNames = @()
    $psms | % { $psmNames += [system.IO.path]::GetFileNameWithoutExtension( $_.Name ) }
    $psds = $files | where { $_.Extension -eq ".psd1" }
    $pss = $files | where { $_.Extension -eq ".ps1" }
    $zips = $files | where { $_.Extension -eq ".zip" }
    $zips | % { $matches.Add( $_ ) > $null }
    $matchNames = $matches | % { [system.IO.Path]::GetFileNameWithoutExtension( $_.Name ) }
    if ( $matchNames -eq $null ) { $matchNames = @() }

    $psms | % { if( !( $matchNames.Contains( [system.IO.Path]::GetFileNameWithoutExtension( $_.Name ) ) ) ){ $matches.Add( $_ ) > $null; $matchNames += [system.IO.Path]::GetFileNameWithoutExtension( $_.Name ); } }
    $psds | % { if( !( $matchNames.Contains( [system.IO.Path]::GetFileNameWithoutExtension( $_.Name ) ) ) ){ $matches.Add( $_ ) > $null; $matchNames += [system.IO.Path]::GetFileNameWithoutExtension( $_.Name ); } }
    $pss | % { if( !( $matchNames.Contains( [system.IO.Path]::GetFileNameWithoutExtension( $_.Name ) ) ) ){ $matches.Add( $_ ) > $null; $matchNames += [system.IO.Path]::GetFileNameWithoutExtension( $_.Name ); } }
}

function loadMatches
{
    [CmdletBinding()]
    param( $target, $searchPath )

    if( Test-Path $target )
    {
        load $target
        return
    }

    Write-Host -NoNewline -ForegroundColor DarkGray "Module search path ["
    Write-Host -NoNewline -ForegroundColor DarkGreen "$searchPath"
    Write-Host -ForegroundColor DarkGray "]"

    $searchPath = Join-Path $searchPath "*$target*"
    Write-Host -NoNewline -ForegroundColor DarkGray "Searching for module ["
    Write-Host -NoNewline -ForegroundColor DarkGreen "$target"
    Write-Host -ForegroundColor DarkGray "]"
    #$files = dir "*$target*" -Recurse
    $files = dir $searchPath -Recurse
    if( $files -eq $null ){ throw ( "Unable to locate module $target" ); exit 1; }

    $matches = New-Object "System.Collections.ArrayList"
    filterMatches $files $matches
    foreach( $match in $matches )
    {
        load $match
    }
}

function loadpsm
{
    [CmdletBinding()]
    param( $target, $searchPath = $executingScriptPath, $unpackPath = "$executingScriptPath\modules" )
    try{
        loadMatches $target $searchPath
    }
    catch
    {
        Write-Host -ForegroundColor DarkRed $_
        Write-Host -ForegroundColor DarkRed  "---------------------- Call Stack: ----------------------"
        Write-Host -ForegroundColor DarkRed $_.ScriptStackTrace
        exit 1
    }
}