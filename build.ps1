[CmdletBinding()]
param(
    $target = 'build',
    [hashtable] $settings = @{ 'version' = '1.0.0.0'; environment = 'local'; server = 'local' }
)

$executingScript = $MyInvocation.MyCommand.Path
$executingScriptPath = split-path $executingScript
pushd $executingScriptPath

#make sure we have the latest version running in this shell context
import-module .\build\loadpsm.psd1 -Force
loadpsm modules

target db -depends downloadData,dbBuild
target dbBuild -depends BuildSQLDeploymentScript.ps1
target deploydb -depends DeploySQL.ps1
target buildrelease -depends packageUnmodified, archiveUnmodified
target packageUnmodified -depends package.ps1
target archiveUnmodified -depends copyToS3.ps1
target downloadData -depends downloadData.ps1
target uploadData -depends uploadData.ps1
target localDb -depends downloadData,localBuild.ps1
target localDbNoDownload -depends localBuild.ps1

build $target -settings $settings -scriptsSearchPath .\build -settingsSearchPath .\build\settings

popd
