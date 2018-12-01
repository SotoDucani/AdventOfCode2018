# Day 1 Notes

+ Note for those unfamiliar w/ PowerShell: Get-Content returns a collection of objects, each representing 1 line of the input file. Makes it easy to move through the file.
+ Part 1 was pretty simple. Important to remember to cast the number to an int, otherwise $sum goes nuts
+ Only real line of note here is the $SeenFreq array definition.

Typically `$SeenFreq = @()` is the way I define something as an array, however you cannot actually use the `.add()` method (arrays are restricted to it's defined length) additional values to an array defined like this. You must use `$SeenFreq = $SeenFreq + $sum` which creates a entirely new array (computationally expensive). This causes the script to box down severely around iteration 18.

Instead, defining $SeenFreq as a 'List' allows use of the `.add()` method which is much much faster.
