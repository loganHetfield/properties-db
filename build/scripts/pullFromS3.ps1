param( 
    $target,
    $destination,
    $repo = 's3://ESO_Build_Repository_v2/' )

function init
{
    if( !( test-path $destination ) ) { 
        mkdir $destination > $null
        if( !( test-path $destination ) ) { throw ( "The directory $destination does not exist and could not be created." ); exit 1; }
    }
    
    if( ( Get-Module loadpsm ) -eq $null  ) { import-module .\loadpsm.psd1 -Force }
    if( ( Get-Module awslib ) -eq $null ) { loadpsm awslib }
}

function pullFromS3
{
    $path = [system.IO.Path]::Combine( $repo, $target )
    Write-Host -NoNewline -ForegroundColor DarkGray "Pulling "
    Write-Host -NoNewline -ForegroundColor DarkGreen $target
    Write-Host -NoNewline -ForegroundColor DarkGray " from "
    Write-Host -NoNewline -ForegroundColor DarkGreen $path
    Write-Host -NoNewline -ForegroundColor DarkGray " to "
    Write-Host -NoNewline -ForegroundColor DarkGreen $destination
    Write-Host -ForegroundColor DarkGray ": "
    aws -command s3 -subcommand cp -options $path, $destination
    if( !$? ){ exit 1; }
    Write-Host -NoNewline -ForegroundColor DarkGray "Pulling "
    Write-Host -NoNewline -ForegroundColor DarkGreen $target
    Write-Host -NoNewline -ForegroundColor DarkGray " from "
    Write-Host -NoNewline -ForegroundColor DarkGreen $path
    Write-Host -NoNewline -ForegroundColor DarkGray " to "
    Write-Host -NoNewline -ForegroundColor DarkGreen $destination
    Write-Host -ForegroundColor DarkGray ": complete"
}

init
pullFromS3
