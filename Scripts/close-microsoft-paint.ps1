﻿<#
.SYNOPSIS
	Closes the Microsoft Paint app 
.DESCRIPTION
	This script closes the Microsoft Paint application gracefully.
.EXAMPLE
	PS> ./close-microsoft-paint
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

TaskKill /im mspaint.exe
if ($lastExitCode -ne "0") {
	& "$PSScriptRoot/speak-english.ps1" "Sorry, can't close Microsoft Paint"
	exit 1
}
exit 0 # success