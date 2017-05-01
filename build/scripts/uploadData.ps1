
$localDir = join-path $env:ProgramData -ChildPath "MDMDataFileCache"

if ( -not (Test-Path $localDir) ) 
{
    mkdir $localDir | out-null
}

$s3Path = "s3://ESO_Build_Repository_v2/MDM/datafiles/"

dir $localDir |% { 
    $name = $_.Name
    $awsEntry = aws -command s3 -subcommand ls -options "$s3Path$name"
    [bool]$uploaded = $false
    if ( $awsEntry -ne $null )
    {
    	$toks = $awsEntry.split(' '); 
    	$date = $toks[0] + " " + $toks[1]; 
    	$size = $toks[2]; 
    	$awsName = $toks[3];

    	if ( $_.LastWriteTime.ToString('yyyy-MM-dd HH:mm:ss') -ne $date )
    	{
     	   "Uploading $name"
    	    aws -command s3 -subcommand cp -options $_.FullName,"$s3Path$name"
	    $uploaded = $true
   	 }
    }
    else
    {
   	aws -command s3 -subcommand cp -options $_.FullName,"$s3Path$name"
	$uploaded = $true
    }

    if ( $uploaded )
    {
	$awsEntry = aws -command s3 -subcommand ls -options "$s3Path$name"
    	$toks = $awsEntry.split(' '); 
    	$date = $toks[0] + " " + $toks[1]; 

	$uploadedFile = Get-Item ($_.FullName)

	$uploadedFile.LastWriteTime = [System.DateTime]::Parse($date)
    }
}