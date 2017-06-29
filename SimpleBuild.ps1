[CmdletBinding()]
param($databaseDirs = @('Properties'))

$executingScript = $MyInvocation.MyCommand.Path
$executingScriptPath = split-path $executingScript
pushd  $executingScriptPath

if ( $databaseDirs.Count -eq 0 ) {
    $databaseDirs = (get-childitem *\Manifest.txt | % { $_.directory.name })
}

import-module ./Util.psm1

function run {
    $ErrorActionPreference = 'Stop'
	
	write-verbose "Starting"
	
    foreach ($databaseDir in $databaseDirs) {
		write-verbose "Processing Directory $relativePath"
        $baseDir = resolve-path $databaseDir
        generate-sqlcmdscript $baseDir
    }
}

function generate-sqlcmdscript($baseDir) {
    try {
        pushd $baseDir

        write-verbose "Processing scripts in $baseDir..."

        $scriptFiles = get-content Manifest.txt | ? { -not $_.startswith('#') } | ? { $_ -ne $null -and $_.Trim().Length -gt 0 }| % { 'get-childitem ' + $_ } | invoke-expression | ? { $_.Name -ne 'deploy.sql' } | ?{ -not $_.PSIsContainer } | get-uniquefiles
        $sqlCmdScript = $scriptFiles | get-script
        $sqlCmdFile = join-path $baseDir deploy.sql
        set-content $sqlCmdFile ("SET QUOTED_IDENTIFIER ON`n`n");
        Add-Content $sqlCmdFile $sqlCmdScript;
    }
    finally {
        popd
    }

    write-verbose "Done. See $sqlCmdFile."
    
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

##.\ESOSUITE_MDM\dataload\CreateBulkImportSQL.ps1
run
popd