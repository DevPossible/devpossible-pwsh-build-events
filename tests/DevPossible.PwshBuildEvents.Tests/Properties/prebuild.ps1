# Pre-build script
# All MSBuild properties are available via environment variables (prefixed with PWSH_)

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "       PRE-BUILD SCRIPT EXECUTED       " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`n--- Project Info ---" -ForegroundColor Yellow
Write-Host "PROJECT_NAME:       $env:PWSH_PROJECT_NAME"
Write-Host "PROJECT_DIR:        $env:PWSH_PROJECT_DIR"
Write-Host "PROJECT_PATH:       $env:PWSH_PROJECT_PATH"
Write-Host "PROJECT_FILE_NAME:  $env:PWSH_PROJECT_FILE_NAME"
Write-Host "ASSEMBLY_NAME:      $env:PWSH_ASSEMBLY_NAME"
Write-Host "ROOT_NAMESPACE:     $env:PWSH_ROOT_NAMESPACE"
Write-Host "OUTPUT_TYPE:        $env:PWSH_OUTPUT_TYPE"

Write-Host "`n--- Build Configuration ---" -ForegroundColor Yellow
Write-Host "CONFIGURATION:      $env:PWSH_CONFIGURATION"
Write-Host "PLATFORM:           $env:PWSH_PLATFORM"
Write-Host "TARGET_FRAMEWORK:   $env:PWSH_TARGET_FRAMEWORK"
Write-Host "RUNTIME_IDENTIFIER: $env:PWSH_RUNTIME_IDENTIFIER"
Write-Host "DEFINE_CONSTANTS:   $env:PWSH_DEFINE_CONSTANTS"
Write-Host "OPTIMIZE:           $env:PWSH_OPTIMIZE"
Write-Host "DEBUG_TYPE:         $env:PWSH_DEBUG_TYPE"
Write-Host "LANGVERSION:        $env:PWSH_LANGVERSION"
Write-Host "NULLABLE:           $env:PWSH_NULLABLE"

Write-Host "`n--- Versioning ---" -ForegroundColor Yellow
Write-Host "VERSION:            $env:PWSH_VERSION"
Write-Host "ASSEMBLY_VERSION:   $env:PWSH_ASSEMBLY_VERSION"
Write-Host "FILE_VERSION:       $env:PWSH_FILE_VERSION"

Write-Host "`n--- Solution Info ---" -ForegroundColor Yellow
Write-Host "SOLUTION_DIR:       $env:PWSH_SOLUTION_DIR"
Write-Host "SOLUTION_NAME:      $env:PWSH_SOLUTION_NAME"
Write-Host "SOLUTION_PATH:      $env:PWSH_SOLUTION_PATH"

Write-Host "`n--- Output Paths ---" -ForegroundColor Yellow
Write-Host "OUT_DIR:            $env:PWSH_OUT_DIR"
Write-Host "BASE_OUTPUT_PATH:   $env:PWSH_BASE_OUTPUT_PATH"
Write-Host "INTERMEDIATE_PATH:  $env:PWSH_INTERMEDIATE_OUTPUT_PATH"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
