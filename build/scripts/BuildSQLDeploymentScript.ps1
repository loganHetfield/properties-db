param( $scriptPath,
       $outputPath,
       $deployScriptSuffix = '-deploy.sql' )
    
function init()
{
    $searchPath = Join-Path $scriptPath '*\Manifest.txt'
    $matches = dir $searchPath -Recurse
    if( $matches -is [string] ) { $script:databaseDirs = $matches.Diretory.Name; }
    else { $script:databaseDirs = $matches | % { $_.directory.fullname } }
    
    Write-Host "db scripts found: " 
    $script:databaseDirs | % { Write-Host $_ }
}

function runthis() {
    $ErrorActionPreference = 'Stop'

    foreach ($databaseDir in $script:databaseDirs) {
        $baseDir = resolve-path $databaseDir
        generate-sqlcmdscript $baseDir
    }
}

function generate-sqlcmdscript($baseDir) {
    try {
        pushd $baseDir

        write-verbose "Processing scripts in $baseDir..."

        $scriptFiles = get-content Manifest.txt | ? { -not $_.startswith('#') } | % { 'get-childitem ' + $_ } | invoke-expression | ? { $_.Name -ne 'deploy.sql' } | get-uniquefiles
        $sqlCmdScript = $scriptFiles | get-script
        $deployScriptName = [system.io.path]::GetFileName( $baseDir.Path ) + $deployScriptSuffix
        Write-Host "writing $deployScriptName"
        $deployScriptName = join-path $baseDir $deployScriptName
        set-content $deployScriptName $sqlCmdScript
        $deployScriptName
    }
    finally {
        popd
    }

    write-verbose "Done. See $deployScriptName."
}

function get-script($resultFile) {
    process {
        $relativePath = resolve-path $_ -relative
        write-verbose "Processing $relativePath."
        "PRINT 'Processing file: $relativePath...'"
        "GO"
        ":r $relativePath"
        ""
    }
}

# get-unique requires a sorted list but we don't want to change the order.  select-object -unique appears to be n^2 so it's too slow.  Here's a faster method:
function get-uniquefiles() {
        begin {
                $seen = @{}
        }
        process {
                $key = $_.FullName
                if (!($seen.ContainsKey($key))) {
                        $seen[$key] = $true
                        $_
                }
        }
}

init
runthis