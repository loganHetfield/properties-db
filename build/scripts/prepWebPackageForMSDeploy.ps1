param( $packageRoot = "..\output",
       $content = "..\output\content",
       $environment = $null )

function init
{
    if( !( test-path $content ) ) { throw ( "content folder does not exist [$content]" ); exit 1; } 
    if( ( Get-Module loadpsm ) -eq $null  ) { import-module .\loadpsm.psd1 -Force }
    if( ( Get-Module msdeploy ) -eq $null ) { loadpsm msdeploy }
}

function moveMSDeployPackageFiles
{
    $archivePattern = Join-Path $content "*\archive.xml"
    $archiveFile = dir $archivePattern -Recurse
    $systemInfoPattern = Join-Path $content "*\systemInfo.xml"
    $systemInfoFile = dir $systemInfoPattern -Recurse
    $parametersPattern = Join-Path $content "*\parameters.xml"
    $parametersFile = dir $parametersPattern -Recurse
    $setParametersPattern = Join-Path $content "*\setparameters.$environment.xml"
    $setParametersFile = dir $setParametersPattern -Recurse
    
    if( $archiveFile -eq $null ){ throw ( "unable to locate $archivePattern." ); exit 1 }
    if( $systemInfoFile -eq $null ){ throw ( "unable to locate $systemInfoPattern." ); exit 1 }
    if( $parametersFile -eq $null ){ throw ( "unable to locate $parametersPattern." ); exit 1 }
    if( $setParametersFile -eq $null ){ throw ( "unable to locate $setParametersPattern." ); exit 1 }
    
    Write-Host -NoNewline -ForegroundColor DarkGray "Moving ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $archiveFile
    Write-Host -NoNewline -ForegroundColor DarkGray "] to ["
    Write-Host -ForegroundColor DarkGreen $packageRoot
    mv $archiveFile $packageRoot 
    if( !$? ){ exit 1}
    
    Write-Host -NoNewline -ForegroundColor DarkGray "Moving ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $systemInfoFile
    Write-Host -NoNewline -ForegroundColor DarkGray "] to ["
    Write-Host -ForegroundColor DarkGreen $packageRoot
    mv $systemInfoFile $packageRoot 
    if( !$? ){ exit 1}
    
    Write-Host -NoNewline -ForegroundColor DarkGray "Moving ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $parametersFile
    Write-Host -NoNewline -ForegroundColor DarkGray "] to ["
    Write-Host -ForegroundColor DarkGreen $packageRoot
    mv $parametersFile $packageRoot 
    if( !$? ){ exit 1}
    
    Write-Host -NoNewline -ForegroundColor DarkGray "Moving ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $setParametersFile
    Write-Host -NoNewline -ForegroundColor DarkGray "] to ["
    Write-Host -ForegroundColor DarkGreen $packageRoot
    mv $setParametersFile $packageRoot 
    if( !$? ){ exit 1}
}

init
moveMSDeployPackageFiles