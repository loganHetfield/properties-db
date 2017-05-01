
param(
    [Parameter()]
    [string]$UserName="sa",
    [Parameter()]
    [string]$Password="Password#1",
    [Parameter()]
    [string]$Server="localhost"
)

$ErrorActionPreference = "Stop"

function callSql($file)
{
    $si = New-Object System.Diagnostics.ProcessStartInfo
    $si.Arguments = "-U $UserName -P $Password -S $Server -d ESOSUITE_MDM -i $file -b -r0"
    $si.UseShellExecute = $false
    $si.RedirectStandardOutput = $true
    $si.RedirectStandardError = $true
    $si.WorkingDirectory = $workingDir
    $si.FileName = "sqlcmd.exe"
    [Diagnostics.Process]$process = [Diagnostics.Process]::Start($si)
     while (!($process.HasExited))
    {
        // do what you want with strerr and stdout
        Start-Sleep -s 1  // sleep for 1s
    }
}

$output = ""
pushd (Split-Path $MyInvocation.MyCommand.Path)
try {
    pushd "ESOSUITE_MDM"
    try {
        if ( Test-Path .\dropAll.sql )
        { 
            sqlcmd -U $UserName -P $Password -S $Server -d "ESOSUITE_MDM" -i .\dropAll.sql -b 
       
            if ( -not $?  )
            {
                throw "SQL Failed dropAll.sql"
            }     
        }
        sqlcmd -U $UserName -P $Password -S $Server -d "ESOSUITE_MDM_Dataload" -i .\deploy.sql -b  

        if ( -not $?  )
        {
            throw "SQL Failed deploy.sql"
        }
    }
    finally { 
    
    popd 
    }


}
finally { popd }

