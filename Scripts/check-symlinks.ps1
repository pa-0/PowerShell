﻿<#
.SYNOPSIS
	Checks every symlink in a folder 
.DESCRIPTION
	This PowerShell script checks every symlink in a folder (including subfolders).
	Returns the number of broken symlinks as exit value.
.PARAMETER folder
	Specifies the path to the directory tree
.EXAMPLE
	PS> ./check-symlinks .
	✔️ 0 out of 10 symlinks are broken in 📂/home/markus
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz / License: CC0
#>

param([string]$folder = "")

try {
	if ($folder -eq "" ) { $folder = read-host "Enter the path to the folder" }

	$StopWatch = [system.diagnostics.stopwatch]::startNew()
	$FullPath = Resolve-Path "$folder"
	"⏳ Checking every symlink in 📂$FullPath ..."

	[int]$NumTotal = [int]$NumBroken = 0
	Get-ChildItem $FullPath -recurse  | Where { $_.Attributes -match "ReparsePoint" } | ForEach-Object {
		$Symlink = $_.FullName
		$Target = ($_ | Select-Object -ExpandProperty Target -ErrorAction Ignore)
		if ($Target) {
			$path = $_.FullName + "\..\" + ($_ | Select-Object -ExpandProperty Target)
			$item = Get-Item $path -ErrorAction Ignore
			if (!$item) {
				"Bad $Symlink 🠆 $Target"
				$NumBroken++
			}
		}
		$NumTotal++
	}

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✔️ checked $NumTotal symlinks in 📂$FullPath ($NumBroken are broken) in $Elapsed sec"
	exit $NumBroken
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
