
function regexReplace
{
    [CmdletBinding()]  
    param( $text, $patterns ) 
    foreach( $rule in $patterns )
    {
        if( !( $rule.ContainsKey( 'pattern' ) ) ) { throw ("No pattern supplied"); exit 1; }
        if( !( $rule.ContainsKey( 'replacement' ) ) ) { throw ("No replacement was supplied"); exit 1; }
        Write-Host -NoNewline -ForegroundColor DarkGray "Replacing "
        Write-Host -NoNewline -ForegroundColor DarkGreen $rule[ 'pattern' ]
        Write-Host -NoNewline -ForegroundColor DarkGray " with "
        Write-Host -ForegroundColor DarkGreen $rule[ 'replacement' ]
        
        $match = $text -match $rule[ 'pattern' ]
        if( $match )
        {
            Write-Host -NoNewline -ForegroundColor DarkGray "Match found: " 
            Write-Host -NoNewline -ForegroundColor DarkGreen $rule[ 'pattern' ]
            Write-Host -NoNewline -ForegroundColor DarkGray " -> " 
            Write-Host -ForegroundColor DarkGreen $rule[ 'replacement' ]
            $text = $text -replace $rule[ 'pattern' ], $rule[ 'replacement' ]
        }
    }
    $text
}
