
param(
    [Parameter()]
    [string]$UserName="eso",
    [Parameter()]
    [string]$Password="eso",
    [Parameter()]
    [string]$Server="(local)"
)

$ErrorActionPreference = "Stop"

pushd (Split-Path $MyInvocation.MyCommand.Path)
try {

    pushd "ESOSUITE"
    try {
        ##sqlcmd -b -U $UserName -P $Password -S $Server -d "ESOSUITE" -i .\dropAll.sql
        sqlcmd -b -U $UserName -P $Password -S $Server -d "ESOSUITE" -i .\deploy.sql
    }
    finally { popd }

    pushd "ESOSUITE_MDM"
    try {
        sqlcmd -b -U $UserName -P $Password -S $Server -d "ESOSUITE_MDM" -i .\deploy.sql
    }
    finally { popd }

}
finally { popd }
