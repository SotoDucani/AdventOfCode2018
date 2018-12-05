function Day2Pt1 {
    $dayinput = Get-Content -Path ".\Day2\input.txt"

    $TwoResults = 0
    $ThreeResults = 0
    foreach($ID in $dayinput) {
        $ResultHashtable = @{}
        $IDCharArray = $ID.ToCharArray()
        #Write-Host $IDCharArray
        foreach ($Letter in $IDCharArray) {
            #Write-Host "Found Letter: $($Letter)"
            if ($ResultHashtable.ContainsKey($Letter)) {
                $ResultHashtable[$Letter] = $ResultHashtable[$Letter] + 1
                #Write-Host "Already contains: $($Letter): Incremented to $($ResultHashTable[$Letter])"
            } else {
                $ResultHashtable.Add($Letter,1)
                #Write-Host "Did not contain: $($Letter): Set to $($ResultHashTable[$Letter])"
            }
        }
        $twocounted = $false
        $threecounted = $false
        $ResultHashtable.Keys | ForEach-Object {
            if ($ResultHashTable[$_] -eq 2 -and !$twocounted) {
                $TwoResults = $TwoResults + 1
                $twocounted = $true
            }
            if ($ResultHashTable[$_] -eq 3 -and !$threecounted) {
                $ThreeResults = $ThreeResults + 1
                $threecounted = $true
            }
        }
        #Write-Host "Two: $($TwoResults)"
        #Write-Host "Three: $($ThreeResults)"
    }

    $Checksum = [int]$TwoResults * [int]$ThreeResults

    Write-Host "Checksum is: $($Checksum)"
}