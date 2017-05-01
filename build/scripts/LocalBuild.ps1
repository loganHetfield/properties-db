
param ( $databaseServer, 
	$dbUserName,
	$dbPassword)

	pushd SQL
	.\build.ps1		
        pushd ESOSUITE	
         sqlcmd -b -U $dbUserName -P $dbPassword -S $databaseServer -d "ESOSUITE" -i .\deploy.sql
	popd
	 .\DeployMDM.ps1 $dbUserName $dbPassword $databaseServer

	popd
