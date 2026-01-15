#Requires -Version 7.0
<#
.SYNOPSIS
    Runs a smoke test by building the test project.
.DESCRIPTION
    Builds the test project to verify that pre-build and post-build scripts execute correctly.
.PARAMETER Configuration
    Build configuration (Debug or Release). Default: Debug.
.EXAMPLE
    ./test-smoke.ps1
#>
[CmdletBinding()]
param(
    [Parameter()]
    [ValidateSet('Debug', 'Release')]
    [string]$Configuration = 'Debug'
)

$ErrorActionPreference = 'Stop'
$projectRoot = $PSScriptRoot
$testProjectPath = Join-Path $projectRoot 'tests' 'DevPossible.PwshBuildEvents.Tests' 'DevPossible.PwshBuildEvents.Tests.csproj'

Write-Host "Running smoke test ($Configuration)..." -ForegroundColor Cyan
Write-Host "Building test project to verify build events execute..." -ForegroundColor Gray
Write-Host ""

dotnet build $testProjectPath -c $Configuration
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host ""
Write-Host "Smoke test completed successfully!" -ForegroundColor Green
Write-Host "If you saw PRE-BUILD and POST-BUILD messages above, the package is working correctly." -ForegroundColor Gray
