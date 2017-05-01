[CmdletBinding()]
param(  $version, 
        $serviceUserName, 
        $servicePassword, 
        $server, 
		$dbUserName,
		$dbPassword)

$remoteScriptBlock = {
    param ($versionToDeploy, 
           $serviceUserName, 
           $servicePassword, 
           $databaseServer, 
		   $dbUserName,
		   $dbPassword) 
		   
	function UnzipToDir($zipFile, $dir)
	{
		Write-Host "Unziping $zipFile to $dir"

		if ( -not (Test-Path $dir) ) { mkdir $dir -Force | out-null }
		$shell = new-object -com shell.application
		$deployZip = $shell.NameSpace($zipFile)
		$targetDir = $shell.NameSpace($dir)
		$deployZip.Items() |% { $targetDir.CopyHere($_, 1044) }
		[System.Runtime.Interopservices.Marshal]::ReleaseComObject($shell) | Out-null
	}
	   
    Write-Output ("Deploy $versionToDeploy to " + $env:COMPUTERNAME)
    Import-Module c:\buildtools\awslib\awslib.psm1 -Force
    if ( -not (Test-Path c:\temp) ) { md c:\temp | out-null }
    if ( -not (Test-Path c:\buildtmp) ) { md c:\buildtmp | out-null }
    aws -command s3 -subcommand cp -options "s3://ESO_Build_Repository_v2/MDM/MDM-$versionToDeploy.zip",'c:\buildtmp\mdm.zip',''

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

	UnzipToDir c:\buildtmp\mdm.zip "c:\temp\$versionToDeploy"
	
	pushd "c:\temp\$versionToDeploy"
	
	.\build.ps1		
        pushd ESOSUITE
	"Updating ESOSUITE"	
         sqlcmd -b -U $dbUserName -P $dbPassword -S $databaseServer -d "ESOSUITE" -i .\deploy.sql

       
            if ( -not $?  )
            {
                throw "Updating ESOSUITE FAILED"
            }

	"Done Updating ESOSUITE"
	popd
	"Updating ESOSUITE_MDM"	
	.\DeployMDM.ps1 $dbUserName $dbPassword $databaseServer
	"Done Updating ESOSUITE_MDM"	

    Push-Location c:\temp
    Remove-Item "c:\temp\$versionToDeploy" -Recurse -Force
}

Set-Item wsman:\localhost\Client\TrustedHosts -value * -Force

$secpasswd = ConvertTo-SecureString $servicePassword -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential ($serviceUserName, $secpasswd)
$errorMessage = ""

Invoke-Command -ComputerName $server -Credential $creds -ScriptBlock $remoteScriptBlock -ArgumentList $version, $serviceUserName, $servicePassword, "(local)", $dbUserName, $dbPassword -ErrorAction Stop 
