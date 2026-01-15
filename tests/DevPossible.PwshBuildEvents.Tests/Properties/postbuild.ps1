# Post-build script
# All MSBuild properties are available via environment variables (prefixed with MBLD_)

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "       POST-BUILD SCRIPT EXECUTED      " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

Write-Host "`n--- Project Info ---" -ForegroundColor Yellow
Write-Host "PROJECT_NAME:       $env:MBLD_PROJECT_NAME"
Write-Host "PROJECT_DIR:        $env:MBLD_PROJECT_DIR"
Write-Host "PROJECT_PATH:       $env:MBLD_PROJECT_PATH"
Write-Host "ASSEMBLY_NAME:      $env:MBLD_ASSEMBLY_NAME"
Write-Host "OUTPUT_TYPE:        $env:MBLD_OUTPUT_TYPE"

Write-Host "`n--- Build Configuration ---" -ForegroundColor Yellow
Write-Host "CONFIGURATION:      $env:MBLD_CONFIGURATION"
Write-Host "PLATFORM:           $env:MBLD_PLATFORM"
Write-Host "TARGET_FRAMEWORK:   $env:MBLD_TARGET_FRAMEWORK"
Write-Host "DEFINE_CONSTANTS:   $env:MBLD_DEFINE_CONSTANTS"
Write-Host "OPTIMIZE:           $env:MBLD_OPTIMIZE"

Write-Host "`n--- Target Output (Post-Build Only) ---" -ForegroundColor Yellow
Write-Host "TARGET_DIR:         $env:MBLD_TARGET_DIR"
Write-Host "TARGET_PATH:        $env:MBLD_TARGET_PATH"
Write-Host "TARGET_FILE_NAME:   $env:MBLD_TARGET_FILE_NAME"
Write-Host "TARGET_NAME:        $env:MBLD_TARGET_NAME"
Write-Host "TARGET_EXT:         $env:MBLD_TARGET_EXT"
Write-Host "OUT_DIR:            $env:MBLD_OUT_DIR"

Write-Host "`n--- Versioning ---" -ForegroundColor Yellow
Write-Host "VERSION:            $env:MBLD_VERSION"
Write-Host "ASSEMBLY_VERSION:   $env:MBLD_ASSEMBLY_VERSION"
Write-Host "FILE_VERSION:       $env:MBLD_FILE_VERSION"

Write-Host "`n--- Solution Info ---" -ForegroundColor Yellow
Write-Host "SOLUTION_DIR:       $env:MBLD_SOLUTION_DIR"
Write-Host "SOLUTION_NAME:      $env:MBLD_SOLUTION_NAME"

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
