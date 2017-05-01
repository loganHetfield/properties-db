$localDir = join-path $env:ProgramData -ChildPath "MDMDataFileCache"

if ( -not (Test-Path $localDir) ) 
{
    mkdir $localDir | out-null
}

$s3Path = "s3://ESO_Build_Repository_v2/MDM/datafiles/"


aws -command s3 -subcommand ls -options $s3Path |% { $_ -replace '\s+',' '} |% { 
    $toks = $_.split(' '); 
    $date = $toks[0] + " " + $toks[1]; 
    $size = $toks[2]; 
    $name = $toks[3];

    $targetPath = join-path $localDir -ChildPath $name

    $copy = $false
    if ( Test-Path $targetPath )
    {
        $targetFile = Get-Item $targetPath
        
        if ( $targetFile.LastWriteTime.ToString('yyyy-MM-dd HH:mm:ss') -ne $date )
        {
            $copy = $true
        }
    }
    else
    {
        $copy = $true
    }

    if ( $copy ) 
    {
        "Downloading $name"
        aws -command s3 -subcommand cp -options "$s3Path$name",$targetPath
    }
}