# =============================================================================
# POST-BUILD SCRIPT
# =============================================================================
# This script runs after successful compilation. Add your post-build logic here.
#
# All MSBuild properties are available via environment variables prefixed with PWSH_
# For the full list, see: https://github.com/devpossible/DevPossible.PwshBuildEvents
#
# Common variables:
#   $env:PWSH_PROJECT_NAME      - Project name
#   $env:PWSH_PROJECT_DIR       - Project directory
#   $env:PWSH_CONFIGURATION     - Debug/Release
#   $env:PWSH_TARGET_FRAMEWORK  - net8.0, net6.0, etc.
#   $env:PWSH_TARGET_DIR        - Output directory (e.g., bin\Debug\net8.0\)
#   $env:PWSH_TARGET_PATH       - Full path to output assembly
#   $env:PWSH_TARGET_FILE_NAME  - Output filename (e.g., MyApp.dll)
#   $env:PWSH_TARGET_NAME       - Output name without extension
#   $env:PWSH_TARGET_EXT        - Output extension (.dll, .exe)
# =============================================================================

$ErrorActionPreference = 'Stop'

Write-Host "Post-build: $env:PWSH_PROJECT_NAME -> $env:PWSH_TARGET_FILE_NAME" -ForegroundColor Green

# -----------------------------------------------------------------------------
# ADD YOUR POST-BUILD LOGIC BELOW
# -----------------------------------------------------------------------------

# Example: Copy output to a shared folder
# $destination = "\\server\share\builds\$env:PWSH_PROJECT_NAME"
# if (-not (Test-Path $destination)) { New-Item -ItemType Directory -Path $destination -Force | Out-Null }
# Copy-Item "$env:PWSH_TARGET_PATH" -Destination $destination -Force

# Example: Run post-build validation
# & "$env:PWSH_TARGET_DIR\MyApp.exe" --validate

# Example: Generate documentation
# if ($env:PWSH_CONFIGURATION -eq 'Release') {
#     Write-Host "Generating documentation..."
#     # docfx build
# }

# Example: Copy additional files to output
# Copy-Item "$env:PWSH_PROJECT_DIR\config\*.json" -Destination $env:PWSH_TARGET_DIR -Force
