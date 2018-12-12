function day3pt1 {
    $SizeX = 1000
    $SizeY = 1000

    $fabricSheet = New-Object System.Collections.Hashtable

    $curX = 0
    while ($curX -lt $SizeX) {
        Write-Host "Building X: $($curX)"
        $curY = 0
        $fabricSheet.add($curX, [System.Collections.Hashtable]@{}) | Out-Null
        while ($curY -lt $SizeY) {
            #Write-Host "Building Y: $($curY)"
            $fabricSheet[$curX].add($curY,[System.Collections.ArrayList]@()) | Out-Null
            $curY += 1
        }
        $curX += 1
    }

    $day3input = Get-Content ".\Day3\input.txt"

    $claimList = New-Object System.Collections.ArrayList
    foreach ($line in $day3input) {
        $split = $line.split("#").split("@").Split(",").Split(":").split("x").Trim()
        $claimList.Add(@{id = $split[1]; topLeftX = $split[2]; topLeftY = $split[3]; sizeX = $split[4]; sizeY = $split[5]}) | Out-Null
    }

    Write-Host "Marking claims on Fabric Sheet"
    foreach ($claim in $claimList) {
        $markerX = [int]$claim.topLeftX
        while ($markerX -lt $([int]$claim.topLeftX + [int]$claim.sizeX)) {
            #Write-Host "Marking Column: $($markerX)"
            $markerY = [int]$claim.topLeftY
            while ($markerY -lt $([int]$claim.topLeftY + [int]$claim.sizeY)) {
                #Write-Host "Marking Row: $($markerY)"
                $fabricSheet[$markerX][$markerY].Add($Claim.ID) | Out-Null
                $markerY += 1
            }
            $markerX += 1
        }
    }

    $sizeX = $fabricSheet.Count
    $sizeY = $fabricSheet[0].count

    $claimsOverTwo = 0

    $posX = 0
    while ($posX -lt $sizeX) {
        $posY = 0
        while ($posY -lt $sizeY) {
            if ($fabricSheet[$posX][$posY].Count -ge 2) {
                $claimsOverTwo += 1
            }
            $posY += 1
        }
        $posX += 1
    }
    return $claimsOverTwo
}
