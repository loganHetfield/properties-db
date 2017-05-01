param( $environment = 'dev',
       $server = 'devdb5',
       $binaryPath = '.\output\web',
       $configs = @('Web.config'),
       $cleanup = $false )

function init
{
    if( !( Test-Path $binaryPath ) ){ throw( "The path $binaryPath does not exist." ); exit 1 }

    foreach( $config in $configs )
    {
        if( $config -is [string] )
        {
            $pattern = Join-Path $binaryPath "*\$config"
            $target = dir $pattern -Recurse
            if( $target -eq $null ){ throw ( "Unable to locate a config file in $binaryPath with the name $config." ); exit 1; }
            continue;
        }

        if( $config -is [hashtable] )
        {
            $target = $config.config;
            if( $target -eq $null ) { throw( "Expected a key named 'config' but was $config."); exit 1; }

            $pattern = Join-Path $binaryPath "*\$target"
            $target = dir $pattern -Recurse
            if( $target -eq $null ){ throw ( "Unable to locate a config file in $binaryPath with the name $target." ); exit 1; }

            $base = $config.transform;
            if( $base -eq $null ) { throw( "Expected a key named 'transform' but was $config."); exit 1; }
            continue;
        }

        throw( "Unable to interpret $config" )
        exit 1
    }

    if( ( Get-Module loadpsm ) -eq $null  ) { import-module .\loadpsm.psd1 -Force }
    if( ( Get-Module transformXML ) -eq $null ) { loadpsm transformXML }
}

function match( $config )
{
    foreach( $config in $configs )
    {
        $base = $config
        $target = $config
        if( $config -is [hashtable] )
        {
            $target = $config.config;
            $base = $config.transform;
        }

        $pattern = Join-Path $binaryPath "*\$target"
        $matches = dir $pattern -Recurse
        $matches | % { transform $_ $base }
    }
}

function transform( $target, $base )
{
    $pattern = Join-Path $binaryPath "*\$target"
    $target = ( $target ).FullName

    Write-Host -NoNewline -ForegroundColor DarkGray "Applying transforms to ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $target
    Write-Host -ForegroundColor DarkGray "]"

    $filename = [system.IO.Path]::GetFileNameWithoutExtension( $base )
    $ext = [system.IO.Path]::GetExtension( $target )
    $path = [system.IO.path]::GetDirectoryName( $target )

    $transform = Join-Path $path "$filename.$environment$ext"
    if( Test-Path( $transform ) )
    {
        Write-Host -NoNewline -ForegroundColor DarkGray "Transform type ["
        Write-Host -NoNewline -ForegroundColor DarkGreen $environment
        Write-Host -NoNewline -ForegroundColor DarkGray "] found ["
        Write-Host -NoNewline -ForegroundColor DarkGreen $transform
        Write-Host -ForegroundColor DarkGray "]"
        transformXML $target $transform
        Write-Host -NoNewline -ForegroundColor DarkGray "Applying ["
        Write-Host -NoNewline -ForegroundColor DarkGreen $environment
        Write-Host -ForegroundColor DarkGray "] transform complete."
    }

    $transform = Join-Path $path "$filename.$environment.$server$ext"
    if( Test-Path( $transform ) )
    {
        Write-Host -NoNewline -ForegroundColor DarkGray "Transform type ["
        Write-Host -NoNewline -ForegroundColor DarkGreen "$environment.$server"
        Write-Host -NoNewline -ForegroundColor DarkGray "] found ["
        Write-Host -NoNewline -ForegroundColor DarkGreen $transform
        Write-Host -ForegroundColor DarkGray "]"
        transformXML $target $transform
        Write-Host -NoNewline -ForegroundColor DarkGray "Applying ["
        Write-Host -NoNewline -ForegroundColor DarkGreen "$environment.$server"
        Write-Host -ForegroundColor DarkGray "] transform complete."
    }

    Write-Host -NoNewline -ForegroundColor DarkGray "Applying transforms to ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $target
    Write-Host -ForegroundColor DarkGray "] complete."
}

function cleanup
{
    if( !$cleanup ) { return }

    Write-Host -NoNewline -ForegroundColor DarkGray "Cleaning ["
    Write-Host -NoNewline -ForegroundColor DarkGreen $binaryPath
    Write-Host -ForegroundColor DarkGray "]"

    foreach( $config in $configs )
    {
        $base = $config
        if( $config -is [hashtable] )
        {
            $base = $config.transform;
        }

        $filename = [system.IO.Path]::GetFileNameWithoutExtension( $base )
        $ext = [system.IO.Path]::GetExtension( $base )
        $pattern = Join-Path $binaryPath "$filename.*$ext"
        Write-Host -NoNewline -ForegroundColor DarkGray "Locating transforms ["
        Write-Host -NoNewline -ForegroundColor DarkGreen $pattern
        Write-Host -NoNewline -ForegroundColor DarkGray "]: "

        $matches = dir $pattern -Recurse
        if( $matches -eq $null -or $matches.Count -eq 0 )
        {
            Write-Host -ForegroundColor DarkGray "no matches found."
        }
        else
        {
            Write-Host -NoNewline -ForegroundColor DarkGray "["
            Write-Host -NoNewline -ForegroundColor DarkGreen $matches.Count
            Write-Host -ForegroundColor DarkGray "] matches found."
        }

        $matches | % {
            Write-Host -NoNewline -ForegroundColor DarkGray "Deleting ["
            Write-Host -NoNewline -ForegroundColor DarkGreen $_.Fullname
            Write-Host -NoNewline -ForegroundColor DarkGray "]: "
            del $_
            Write-Host -ForegroundColor DarkGray "complete."
        }
    }
}

init
match
cleanup