# =============================================================================
# PRE-BUILD SCRIPT
# =============================================================================
# This script runs before compilation. Add your pre-build logic here.
#
# All MSBuild properties are available via environment variables prefixed with PWSH_
# For the full list, see: https://github.com/devpossible/DevPossible.PwshBuildEvents
#
# Common variables:
#   $env:PWSH_PROJECT_NAME      - Project name
#   $env:PWSH_PROJECT_DIR       - Project directory
#   $env:PWSH_CONFIGURATION     - Debug/Release
#   $env:PWSH_TARGET_FRAMEWORK  - net8.0, net6.0, etc.
#   $env:PWSH_ASSEMBLY_NAME     - Assembly name
#   $env:PWSH_VERSION           - Version number
#
# Note: Target variables (TARGET_DIR, TARGET_PATH, etc.) are only available in postbuild.ps1
# =============================================================================

$ErrorActionPreference = 'Stop'

Write-Host "Pre-build: $env:PWSH_PROJECT_NAME ($env:PWSH_CONFIGURATION|$env:PWSH_TARGET_FRAMEWORK)" -ForegroundColor Cyan

# -----------------------------------------------------------------------------
# ADD YOUR PRE-BUILD LOGIC BELOW
# -----------------------------------------------------------------------------

# Example: Generate a build timestamp file
# $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
# Set-Content -Path "$env:PWSH_PROJECT_DIR\BuildTimestamp.txt" -Value $timestamp

# Example: Run code generation
# & "$env:PWSH_PROJECT_DIR\tools\generate-code.ps1"

# Example: Validate environment
# if (-not $env:SOME_REQUIRED_VAR) {
#     throw "SOME_REQUIRED_VAR environment variable is required"
# }
