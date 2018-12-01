# AdventOfCode2018

### [Advent of Code 2018 Website](https://adventofcode.com/2018)

I'll be running through Advent of Code this year with PowerShell as my language of choice.

No promises that things are going to be clean or optimized, but I'll at least do my best to keep runtime low.

## Organization and Rules I'm holding myself to
+ I will not be looking at any hints or assistance before being successfully able to complete each day
+ Each day will be in it's own folder
  + A Readme within each parent folder will be used to keep notes about the code used for my actual submission
  + The top-level folder will contain only code and stats pertaining to the code I used to actually submit the solution on the website
+ I'm free to look at hints and other solutions only after successfully submitting my own solution
+ Further modification to my code for the purpose of testing or improvement will be under the Post-Submission folder
  + I'll be trying to keep these modifications to small changes so I can see the differences in behavior.
  + If I want to make a 'uber-solution' of sorts I'll call that out in the folder name
+ Code will be in a basic function block so I can use `Measure-Command -Expression {SolutionCommand}` to get the execution times easily