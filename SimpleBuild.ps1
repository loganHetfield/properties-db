[CmdletBinding()]
param($databaseDirs = @('Properties', 'Inspections'))

$executingScript = $MyInvocation.MyCommand.Path
$executingScriptPath = Split-Path $executingScript

pushd  $executingScriptPath
try {

    if ( $databaseDirs.Count -eq 0 ) {
        $databaseDirs = (Get-ChildItem *\Manifest.txt | % { $_.Directory.name })
    }

    Import-Module .\Util.psm1

    function Run {
        $ErrorActionPreference = 'Stop'
	
	    Write-Verbose "Starting"
	
        foreach ($databaseDir in $databaseDirs) {
		    Write-Verbose "Processing Directory $relativePath"
            $baseDir = Resolve-Path $databaseDir
            Generate-SqlCmdScript $baseDir
        }
    }

    function Generate-SqlCmdScript($baseDir) {
        pushd $baseDir
        try {
            Write-Verbose "Processing scripts in $baseDir..."

            $scriptFiles = Get-Content Manifest.txt |
                ? { -not $_.StartsWith('#') } | 
                ? { $_ -ne $null -and $_.Trim().Length -gt 0 } | 
                % { 'Get-ChildItem ' + $_ } | 
                Invoke-Expression | 
                ? { $_.Name -ne 'deploy.sql' } | 
                ? { -not $_.PSIsContainer } | 
                Get-UniqueFiles

            $sqlCmdScript = $scriptFiles | Get-Script
            $sqlCmdFile = Join-Path $baseDir deploy.sql
            Set-Content $sqlCmdFile ("SET QUOTED_IDENTIFIER ON`n`n");
            Add-Content $sqlCmdFile $sqlCmdScript;
        }
        finally {
            popd
        }

        Write-Verbose "Done. See $sqlCmdFile."
    }

    function Get-Script($resultFile) {
        process {
            $relativePath = Resolve-Path $_ -Relative
            Write-Verbose "Processing $relativePath."
            "PRINT 'Processing file: $relativePath...'"
            "GO"
            ":r $relativePath"
            ""
        }
    }

    Run
}
finally {
    popd
}
