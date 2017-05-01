
function clean
{
    [CmdletBinding()]
    param( $path )

    if( !(Test-Path $path ) ) { return }

    $resolved = Resolve-Path $path
    if( [system.IO.Directory]::Exists( $resolved ) )
    {
        $files = join-path $resolved "*"
        rm $files -Force -recurse
        rmdir $resolved -Force -Recurse
        return
    }

    rmdir $resolved -Force
}