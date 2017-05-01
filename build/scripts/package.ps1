param( $archiveOutputPath,
       $packageSource,
       $packageName,
       $cleanSource = $false )

function init
{
    if( !( test-path $packageSource ) ) { throw ( "Unable to locate source directory $packageSource" ); exit 1 }

    if( !( test-path $archiveOutputPath ) ) { mkdir $archiveOutputPath }

    $script:package = Join-Path $archiveOutputPath $packageName
    if( test-path $script:package ){ rm -Force $script:package }

	$script:packageSource = Join-Path $packageSource "*"

    if( ( Get-Module loadpsm ) -eq $null  ) { import-module .\loadpsm.psd1 -Force }

    if( ( Get-Module 7zip ) -eq $null ) { loadpsm 7zip }
}

function zip
{
    Write-Host -NoNewline -ForegroundColor DarkGray "Packaging "
    Write-Host -NoNewline -ForegroundColor DarkGreen $packageSource
    Write-Host -NoNewline -ForegroundColor DarkGray " -> "
    Write-Host -NoNewline -ForegroundColor DarkGreen $script:package
    Write-Host -ForegroundColor DarkGray ": "

	Write-Host -NoNewline -ForegroundColor DarkGray "Executing commandline: "
	Write-Host -ForegroundColor DarkGreen "7zip -path $packageSource -archive $script:package"

    7zip -path $packageSource -archive $script:package

    Write-Host -NoNewline -ForegroundColor DarkGray "Packaging "
    Write-Host -NoNewline -ForegroundColor DarkGreen $packageSource
    Write-Host -NoNewline -ForegroundColor DarkGray " -> "
    Write-Host -NoNewline -ForegroundColor DarkGreen $script:package
    Write-Host -NoNewline -ForegroundColor DarkGray ": "
    Write-Host -ForegroundColor DarkGreen "complete"
}

function cleanSource
{
    param( $cleanup, $source )

    if( !( $cleanup ) ) { return }

    Write-Host -NoNewline -ForegroundColor DarkGray "Removing ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $source
    Write-Host -ForegroundColor DarkGray "]"
    clean $source
    Write-Host -NoNewline -ForegroundColor DarkGray "Removing ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $source
    Write-Host -ForegroundColor DarkGray "] complete"
}

init
zip
cleanSource $cleanSource $packageSource

