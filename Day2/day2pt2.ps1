function Day2Pt2 {
    $dayinput = Get-Content -Path ".\Day2\input.txt"


    foreach($ID in $dayinput) {
        [System.Collections.ArrayList]$IDCharArray = $ID.ToCharArray()
        Write-Host "Testing: $($ID)"
        foreach ($Compare in $dayinput) {
            $position = 0
            $diffs = 0
            while ($position -lt $IDCharArray.Count) {
                #Write-Host "Comparing: $($IDCharArray[$position]) to $($Compare.ToCharArray()[$position])"
                if ($Compare.ToCharArray()[$position] -ne $IDCharArray[$position]) {
                    $diffs += 1
                    $IDDiffCharPOS = $position
                }
                $position += 1
            }
            #Write-Host "Dif Count: $($diffs)"
            if ($diffs -eq 1) {
                Write-Host "Diff count 1 found"
                $IDCharArray.RemoveAt($IDDiffCharPOS)
                Write-Host "Remaining Chars: $($IDCharArray)"
                Write-Error -Erroraction Stop "Stop"
            }
        }
    }
}