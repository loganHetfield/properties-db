
function JSONTo-Hashtable
{
    [CmdletBinding()]
    param ( $target )
    if( $target -is [string] ){ $target = ConvertFrom-Json $target }
    elseif( $target -isnot [pscustomobject] ){ throw ( "Expected a json object as a string or a PSCustomObject." ); exit 1; }
    $result = @{}
    $target | Get-Member -MemberType NoteProperty | % {
        $value = $($target.($_.Name))
        if( $value -is [pscustomobject] )
        {
            $value = convertToHashtable $value
        }
        $result.Add( $_.Name, $value ) > $null
    }
    $result
}