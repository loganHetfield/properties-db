function cleanGitSource
{
    [CmdletBinding()]  
    param( $sourcePath )
    git clean -df $sourcePath
    if( !$? ){ exit 1 }
    git checkout HEAD $sourcePath
    if( !$? ){ exit 1 }
}