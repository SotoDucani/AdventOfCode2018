$input = Get-Content -Path .\Day1\input.txt

foreach ($num in $input) {
    $sum = $sum + [int]$num
}

Write-Host $sum