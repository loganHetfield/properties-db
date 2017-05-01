param( $package,
       $server = "localhost",
       $dest = "auto",
       $deployuser,
       $deploypw,
       $skip = $null,
       $parametersFile = $null )

function init
{
    if( !( test-path $package ) ) { throw ( "Unable to locate package $package" ); exit 1 } 
    if( ( Get-Module loadpsm ) -eq $null  ) { import-module .\loadpsm.psd1 -Force }
    if( ( Get-Module msdeploy ) -eq $null ) { loadpsm msdeploy }
}

function deployWebPackage
{
    $resolved = Resolve-Path $package
    $deployArgs = @{
        verb = 'sync';
        source = $resolved;
        dest = $dest;
        server = $server;
        username = $deployuser;
        password = $deploypw;
    }
    
    if( $parametersFile -ne $null )
    {
        $resolved = Resolve-Path $parametersFile
        $deployArgs.params = "-setParamFile=$resolved";
    }
    
    if( $skip -ne $null )
    {
        $deployArgs.params = "-skip:objectName=dirPath,absolutePath=$skip"
    }
    
    msdeploy @deployArgs
}

init
deployWebPackage