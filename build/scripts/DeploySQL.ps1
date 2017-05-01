
param(
    [string]$username="eso",
    [string]$password="eso",
    [string]$server="(local)",
    [boolean]$dropAndRecreate=$false,
    $database = 'ESOSUITE',
    $workingDir = '.',
    $deploymentScript
)

$ErrorActionPreference = "Stop"

function DropAndRecreate($database) {
    sqlcmd -b -U $username -P $password -S $server -Q "
    USE master

    IF EXISTS (SELECT name FROM sys.databases WHERE name = N'$database') BEGIN
        PRINT 'Recreating Database $database'

        ALTER DATABASE $database
        SET SINGLE_USER
        WITH ROLLBACK IMMEDIATE

        DROP DATABASE $database
    END
    CREATE DATABASE $database"
}

function deploy()
{
    if( $workingDir -eq $null ) { $workingDir = [system.IO.path]::GetDirectoryName( $deploymentScript ) }
    if( !( Test-Path( $workingDir ) ) ){ throw "Unable to locate working directory script $workingDir"; exit 1; }
    
    pushd $workingDir
    try
    {
        if( $deploymentScript -eq $null ) { throw "deploymentScript must be specified"; exit 1; }
        if( !( Test-Path( $deploymentScript ) ) ){ throw "Unable to locate deployment script $deploymentScript"; exit 1; }

        if ($dropAndRecreate) {
            DropAndRecreate $database
            if ($LASTEXITCODE -ne 0) { return }
        }
        
        Write-Host -NoNewline -ForegroundColor DarkGray "Deploying against ["
        Write-Host -NoNewline -ForegroundColor DarkGreen "$server\$database"
        Write-Host -NoNewline -ForegroundColor DarkGray "]"

        sqlcmd -b -U $username -P $password -S $server -d $database -i $deploymentScript
        
        Write-Host -NoNewline -ForegroundColor DarkGray "Deploying against ["
        Write-Host -NoNewline -ForegroundColor DarkGreen "$server\$database"
        Write-Host -NoNewline -ForegroundColor DarkGray "] complete"
    }
    finally{
        popd
    }
}

deploy