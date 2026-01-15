#Requires -Version 7.0
<#
.SYNOPSIS
    Builds the DevPossible.PwshBuildEvents solution.
.PARAMETER Configuration
    Build configuration (Debug or Release). Default: Release.
.EXAMPLE
    ./build.ps1
    ./build.ps1 -Configuration Debug
#>
[CmdletBinding()]
param(
    [Parameter()]
    [ValidateSet('Debug', 'Release')]
    [string]$Configuration = 'Release'
)

$ErrorActionPreference = 'Stop'
$projectRoot = $PSScriptRoot
$solutionPath = Join-Path $projectRoot 'src' 'DevPossible.PwshBuildEvents.sln'

Write-Host "Building DevPossible.PwshBuildEvents ($Configuration)..." -ForegroundColor Cyan

# Restore and build
dotnet restore $solutionPath
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

dotnet build $solutionPath -c $Configuration --no-restore
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "Build completed successfully." -ForegroundColor Green
