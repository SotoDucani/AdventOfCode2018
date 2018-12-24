function day3pt1 {
    $day3input = Get-Content ".\Day3\input.txt"
    #$day3input = Get-Content ".\Day3\exampleinput.txt"

    $fabricX = 1000
    $fabricY = 1000
    #$fabricX = 8
    #$fabricY = 8

    $fabricSheet = New-Object System.Collections.ArrayList

    Write-Host "Fabric X: $($fabricX)"
    Write-Host "Fabric Y: $($fabricY)"

    $curY = 0
    while ($curY -lt $fabricY) {
        $curX = 0
        while ($curX -lt $fabricX) {
            #Write-Host "Building at: $($curX),$($curY)"
            $fabricSheet.Add(@{locX = $curX; locY = $curY; claims = @()}) | Out-Null
            $curX += 1
        }
        $curY += 1
    }
    Write-Host "Fabric Squares: $($fabricSheet.Count)"

    $claimList = New-Object System.Collections.ArrayList
    foreach ($line in $day3input) {
        $split = $line.split("#").split("@").Split(",").Split(":").split("x").Trim()
        $claimList.Add(@{id = $split[1]; topLeftX = $split[2]; topLeftY = $split[3]; sizeX = $split[4]; sizeY = $split[5]}) | Out-Null
    }
    Write-Host "Claims: $($claimList.Count)"

    foreach ($claim in $claimList) {
        $markerY = [int]$claim.topLeftY
        while ($markerY -lt ([int]$claim.topLeftY + [int]$claim.sizeY)) {
            Write-Host "MarkerY: $($markerY)"
            $markerX = [int]$claim.topLeftX
            while ($markerX -lt ([int]$claim.topLeftX + [int]$claim.sizeX)) {
                Write-Host "MarkerX: $($markerX)"
                $targetSquare = $fabricSheet | Where-Object -FilterScript {$_.locX -eq $markerX -and $_.locY -eq $markerY}
                $targetSquare.claims = $targetSquare.claims + $claim.id
                $markerX += 1
            }
            $markerY += 1
        }
    }

    $multiclaimedSquares = @()

    foreach ($square in $fabricSheet) {
        if ($square.claims.count -ge 2) {
            $multiclaimedSquares = $multiclaimedSquares + $square
        }
    }

    #return $fabricSheet,$claimList
    Write-Host "Squares w/ multiple claims: $($MulticlaimedSquares.Count)"
}