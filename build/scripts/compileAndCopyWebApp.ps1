param( 
    $appPath,
    $destination,
    $itemsToCopy,
    $npmPath,
    $gulpPath,
    $gulpParameters
)

function compileAndCopyWebApp
{
    $basePath = pwd
	pushd $appPath
	Write-Host -ForegroundColor DarkGray "Updating npm packages..."
	. $npmPath install
	Write-Host -ForegroundColor DarkGray "Running gulp..."
    . $gulpPath $gulpParameters
    #$process = new-object System.Diagnostics.Process
    #$process.Startinfo.FileName = "$gulpPath.cmd"
    #$process.StartInfo.Arguments = $gulpParameters
    #$process.StartInfo.WorkingDirectory = $( pwd )
    #$process.StartInfo.CreateNoWindow = $true
    #$process.StartInfo.UseShellExecute = $false
    #$process.StartInfo.RedirectStandardOutput = $true
    #$process.StartInfo.RedirectStandardError = $true
    #Register-ObjectEvent -InputObject $process -EventName OutputDataReceived -Action { param( $sendingProcess, $outline ) Write-Host $outline.Data } > $null
    #Register-ObjectEvent -InputObject $process -EventName ErrorDataReceived -Action { param( $sendingProcess, $errline ) Write-Error $errline.Data } > $null
    #$process.Start() > $null
    #$process.BeginOutputReadLine() > $null
    #$process.BeginErrorReadLine() > $null
    #$process.WaitForExit() > $null
    #$process.StandardOutput.ReadToEnd()
    #$process = Start-Process -FilePath cmd.exe -ArgumentList '/c', $gulpPath, $gulpParameters -WorkingDirectory $( pwd ) -wait 
    #$process.StandardOutput.ReadToEnd()
    #$job = start-job -FilePath "$gulpPath.cmd"  -ArgumentList $gulpParameters
    #Wait-Job $job
    #Receive-Job $job
    
    #{ 
    #    param( $workingPath, $gulp, $parameters )
    #    . $gulp $parameters
        #Write-Host cmd.exe /c "cd $workingPath && $gulp $parameters" 
        #cmd.exe /k "cd $workingPath && dir " #, $gulp $parameters" 
    #} -ArgumentList $( pwd ), $gulpPath, $gulpParameters
    #Wait-Job $job
    #Receive-Job $job
       
	Write-Host -ForegroundColor DarkGray "Copying the app..."
	foreach ($item in $itemsToCopy)
	{
		$pathFrom = [system.IO.Path]::Combine( ".", $item )
        $pathTo = [system.IO.Path]::Combine( $basePath, $destination )
		$pathTo = [system.IO.Path]::Combine( $pathTo, $item )
		
		Write-Host -ForegroundColor DarkGray "Copy from: $pathFrom to $pathTo"
        copy $pathFrom -Destination $pathTo -Recurse
	}
	popd
}

compileAndCopyWebApp
