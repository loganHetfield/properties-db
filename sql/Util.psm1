# get-unique requires a sorted list but we don't want to change the order.  select-object -unique appears to be n^2 so it's too slow.  Here's a faster method:
function get-uniquefiles {
        begin {
                $seen = @{}
        }
        process {
                $key = $_.FullName
                if (!($seen.ContainsKey($key))) {
                        $seen[$key] = $true
                        $_
                }
        }
}

export-modulemember -function *