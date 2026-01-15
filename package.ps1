#Requires -Version 7.0
<#
.SYNOPSIS
    Creates the NuGet package for DevPossible.PwshBuildEvents.
.PARAMETER Version
    Package version. Default: 1.0.0.
.PARAMETER Configuration
    Build configuration (Debug or Release). Default: Release.
.EXAMPLE
    ./package.ps1
    ./package.ps1 -Version 1.0.1
#>
[CmdletBinding()]
param(
    [Parameter()]
    [string]$Version = '1.0.0',

    [Parameter()]
    [ValidateSet('Debug', 'Release')]
    [string]$Configuration = 'Release'
)

$ErrorActionPreference = 'Stop'
$projectRoot = $PSScriptRoot
$srcPath = Join-Path $projectRoot 'src' 'DevPossible.PwshBuildEvents' 'DevPossible.PwshBuildEvents.csproj'
$distPath = Join-Path $projectRoot '.dist'

Write-Host "Packaging DevPossible.PwshBuildEvents v$Version..." -ForegroundColor Cyan

# Ensure dist folder exists
if (!(Test-Path $distPath)) {
    New-Item -ItemType Directory -Path $distPath -Force | Out-Null
}

# Build and pack
dotnet pack $srcPath -c $Configuration -o $distPath /p:Version=$Version
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host ""
Write-Host "Package created in: $distPath" -ForegroundColor Green
Get-ChildItem $distPath -Filter "*.nupkg" | ForEach-Object {
    Write-Host "  - $($_.Name)" -ForegroundColor Gray
}
