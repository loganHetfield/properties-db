param( $archive,
       $outputPath )

function init
{
    $matches = dir $archive -Recurse
    if( $matches -eq $null )
    { 
        throw ( "Unable to locate the archive $archive." ); 
        exit 1 
    }
    
    $script:matches = $matches  | % { $_.FullName }
    
    if( !( test-path $outputPath ) ) { throw ( "Unable to locate output path $outputPath" ); exit 1 } 

    if( ( Get-Module loadpsm ) -eq $null  ) { import-module .\loadpsm.psd1 -Force }
    
    if( ( Get-Module 7zip ) -eq $null ) { loadpsm 7zip }
}

function unzip
{
    param( $matches )
    
    foreach( $archive in $matches )
    {
        $outpath = $outputPath
        if( $matches -isnot [string] )
        { 
            $name = [system.IO.path]::GetFileNameWithoutExtension( $archive )
            $outpath = join-path $outputPath $name
        }
        
        Write-Host -NoNewline -ForegroundColor DarkGray "Unpacking "
        Write-Host -NoNewline -ForegroundColor DarkGreen $archive
        Write-Host -NoNewline -ForegroundColor DarkGray " -> "
        Write-Host -NoNewline -ForegroundColor DarkGreen $outpath
        Write-Host -ForegroundColor DarkGray ": "
    	
    	Write-Host -NoNewline -ForegroundColor DarkGray "Executing commandline: "
    	Write-Host -ForegroundColor DarkGreen "7zip -archive $archive -path $outpath"
    	
        7uzip -archive $archive -path $outpath
        
        Write-Host -NoNewline -ForegroundColor DarkGray "Unpacking "
        Write-Host -NoNewline -ForegroundColor DarkGreen $archive
        Write-Host -NoNewline -ForegroundColor DarkGray " -> "
        Write-Host -NoNewline -ForegroundColor DarkGreen $outpath
        Write-Host -ForegroundColor DarkGray ": "
        Write-Host -ForegroundColor DarkGreen "complete"
    }
}

init
unzip $script:matches

