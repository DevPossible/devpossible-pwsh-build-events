# Pre-build script
# All MSBuild properties are available via environment variables (prefixed with MBLD_)

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "       PRE-BUILD SCRIPT EXECUTED       " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "`n--- Project Info ---" -ForegroundColor Yellow
Write-Host "PROJECT_NAME:       $env:MBLD_PROJECT_NAME"
Write-Host "PROJECT_DIR:        $env:MBLD_PROJECT_DIR"
Write-Host "PROJECT_PATH:       $env:MBLD_PROJECT_PATH"
Write-Host "PROJECT_FILE_NAME:  $env:MBLD_PROJECT_FILE_NAME"
Write-Host "ASSEMBLY_NAME:      $env:MBLD_ASSEMBLY_NAME"
Write-Host "ROOT_NAMESPACE:     $env:MBLD_ROOT_NAMESPACE"
Write-Host "OUTPUT_TYPE:        $env:MBLD_OUTPUT_TYPE"

Write-Host "`n--- Build Configuration ---" -ForegroundColor Yellow
Write-Host "CONFIGURATION:      $env:MBLD_CONFIGURATION"
Write-Host "PLATFORM:           $env:MBLD_PLATFORM"
Write-Host "TARGET_FRAMEWORK:   $env:MBLD_TARGET_FRAMEWORK"
Write-Host "RUNTIME_IDENTIFIER: $env:MBLD_RUNTIME_IDENTIFIER"
Write-Host "DEFINE_CONSTANTS:   $env:MBLD_DEFINE_CONSTANTS"
Write-Host "OPTIMIZE:           $env:MBLD_OPTIMIZE"
Write-Host "DEBUG_TYPE:         $env:MBLD_DEBUG_TYPE"
Write-Host "LANGVERSION:        $env:MBLD_LANGVERSION"
Write-Host "NULLABLE:           $env:MBLD_NULLABLE"

Write-Host "`n--- Versioning ---" -ForegroundColor Yellow
Write-Host "VERSION:            $env:MBLD_VERSION"
Write-Host "ASSEMBLY_VERSION:   $env:MBLD_ASSEMBLY_VERSION"
Write-Host "FILE_VERSION:       $env:MBLD_FILE_VERSION"

Write-Host "`n--- Solution Info ---" -ForegroundColor Yellow
Write-Host "SOLUTION_DIR:       $env:MBLD_SOLUTION_DIR"
Write-Host "SOLUTION_NAME:      $env:MBLD_SOLUTION_NAME"
Write-Host "SOLUTION_PATH:      $env:MBLD_SOLUTION_PATH"

Write-Host "`n--- Output Paths ---" -ForegroundColor Yellow
Write-Host "OUT_DIR:            $env:MBLD_OUT_DIR"
Write-Host "BASE_OUTPUT_PATH:   $env:MBLD_BASE_OUTPUT_PATH"
Write-Host "INTERMEDIATE_PATH:  $env:MBLD_INTERMEDIATE_OUTPUT_PATH"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
