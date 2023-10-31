## The *open-accu-weather.ps1* Script

This PowerShell script launches the Web browser with the AccuWeather website.

## Parameters
```powershell
open-accu-weather.ps1 [<CommonParameters>]

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

## Example
```powershell
PS> ./open-accu-weather

```

## Notes
Author: Markus Fleschutz | License: CC0

## Related Links
https://github.com/fleschutz/PowerShell

## Source Code
```powershell
<#
.SYNOPSIS
	Opens the AccuWeather website 
.DESCRIPTION
	This PowerShell script launches the Web browser with the AccuWeather website.
.EXAMPLE
	PS> ./open-accu-weather
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

& "$PSScriptRoot/open-default-browser.ps1" "https://www.accuweather.com"
exit 0 # success
```

*Generated by convert-ps2md.ps1 using the comment-based help of open-accu-weather.ps1*