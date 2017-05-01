param( 
    $target,
    $destination,
    $repo = 's3://ESO_Build_Repository_v2/' )

function init
{
    if( !( test-path $target ) ) { throw ( "The file or directory $target does not exist." ); exit 1; }
    
    if( ( Get-Module loadpsm ) -eq $null  ) { import-module .\loadpsm.psd1 -Force }
    if( ( Get-Module awslib ) -eq $null ) { loadpsm awslib }
}

function copyToS3
{
    $path = [system.IO.Path]::Combine( $repo, $destination )
    Write-Host -NoNewline -ForegroundColor DarkGray "Copying "
    Write-Host -NoNewline -ForegroundColor DarkGreen $target
    Write-Host -NoNewline -ForegroundColor DarkGray " to "
    Write-Host -NoNewline -ForegroundColor DarkGreen $path
    Write-Host -ForegroundColor DarkGray ": "
    aws -command s3 -subcommand cp -options $target, $path
    if( !$? ){ exit 1; }
    Write-Host -NoNewline -ForegroundColor DarkGray "Copying "
    Write-Host -NoNewline -ForegroundColor DarkGreen $target
    Write-Host -NoNewline -ForegroundColor DarkGray " to "
    Write-Host -NoNewline -ForegroundColor DarkGreen $path
    Write-Host -ForegroundColor DarkGray ": complete."
}

init
copyToS3
