$script:settings = @{ 
    environment = $null;
    server = $null;
    unmodifiedArchiveName = 'MDM-$($settings["version"]).zip';
    releaseArchiveName = 'MDM-$($settings["environment"])-$($settings["server"])-$($settings["version"]).zip';

    '[dbBuild]' = @{
        scriptPath = '.\sql';
        deployScriptSuffix = '-deploy.sql'
    };
    
    '[deploydb]' = @{
        username="eso";
        password="eso";
        server="(local)";
        dropAndRecreate=$false;
        database = 'ESOSUITE';
        workingDir = '.\sql\ESOSUITE'
        deploymentScript = 'ESOSUITE-deploy.sql';
    };   
	
	'[packageUnmodified]' = @{
        archiveOutputPath = '.\output';
        packageSource = '.\sql\*';
        packageName = '$($settings["unmodifiedArchiveName"])';
    };
	
    '[archiveUnmodified]' = @{
        target = '.\output\$($settings["unmodifiedArchiveName"])';
        destination = 'MDM/';
        repo = 's3://ESO_Build_Repository_v2/'
    };
	
    
}