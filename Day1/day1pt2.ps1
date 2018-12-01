$input = Get-Content -Path .\Day1\input.txt

$SeenFreq = New-Object System.Collections.Generic.List[System.Object]
$sum=0
$TwiceSeen=$false
$CurIteration = 0
while ($TwiceSeen -eq $false) {
    $CurIteration += 1
    Write-Host "Iteration: $($CurIteration)"
    foreach ($num in $input) {
        #Write-Host "Adding $($num) to $($sum)"
        $sum = $sum + [int]$num
        #Write-Host "CurFreq: $($Sum)"
        if ($SeenFreq -notcontains $sum) {
            $SeenFreq.add($sum)
            #Write-Host $SeenFreq
        } else {
            Write-Host "Twice Seen: $($sum)"
            $TwiceSeen = $true
            break
        }
    }
}