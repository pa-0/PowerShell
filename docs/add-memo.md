*add-memo.ps1*
================

This PowerShell script saves the given memo text to Memos.csv in your home folder.

Parameters
----------
```powershell
PS> ./add-memo.ps1 [[-text] <String>] [<CommonParameters>]

-text <String>
    Specifies the text to memorize
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

Example
-------
```powershell
PS> ./add-memo.ps1 "Buy apples"
✔️ saved to 📄/home/markus/Memos.csv

```

Notes
-----
Author: Markus Fleschutz | License: CC0

Related Links
-------------
https://github.com/fleschutz/PowerShell

Script Content
--------------
```powershell
<#
.SYNOPSIS
	Adds a memo text 
.DESCRIPTION
	This PowerShell script saves the given memo text to Memos.csv in your home folder.
.PARAMETER text
	Specifies the text to memorize
.EXAMPLE
	PS> ./add-memo.ps1 "Buy apples"
	✔️ saved to 📄/home/markus/Memos.csv
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

param([string]$text = "")

try {
	if ($text -eq "" ) { $text = Read-Host "Enter the text to memorize" }

	$Path = "~/Memos.csv"
	$Time = Get-Date -format FileDateTimeUniversal
	$Line = "$Time,$text"

	if (-not(Test-Path "$Path" -pathType leaf)) {
		Write-Output "TIME,TEXT" > "$Path"
	}
	Write-Output $Line >> "$Path"

	"✔️ saved to 📄$Path"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
```

*(generated by convert-ps2md.ps1 using the comment-based help of add-memo.ps1 as of 10/19/2023 08:11:35)*