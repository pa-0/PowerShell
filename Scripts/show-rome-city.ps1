﻿<#
.SYNOPSIS
	Shows Rome in Google Maps 
.DESCRIPTION
	This script launches the Web browser and shows the city of Rome (Italy) in Google Maps.
.EXAMPLE
	PS> ./show-rome-city
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

& "$PSScriptRoot/open-default-browser.ps1" "https://www.google.com/maps/place/Rome"
exit 0 # success
