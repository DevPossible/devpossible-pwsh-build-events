# Post-build script
# All MSBuild properties are available via environment variables (prefixed with PWSH_)

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "       POST-BUILD SCRIPT EXECUTED      " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

Write-Host "`n--- Project Info ---" -ForegroundColor Yellow
Write-Host "PROJECT_NAME:       $env:PWSH_PROJECT_NAME"
Write-Host "PROJECT_DIR:        $env:PWSH_PROJECT_DIR"
Write-Host "PROJECT_PATH:       $env:PWSH_PROJECT_PATH"
Write-Host "ASSEMBLY_NAME:      $env:PWSH_ASSEMBLY_NAME"
Write-Host "OUTPUT_TYPE:        $env:PWSH_OUTPUT_TYPE"

Write-Host "`n--- Build Configuration ---" -ForegroundColor Yellow
Write-Host "CONFIGURATION:      $env:PWSH_CONFIGURATION"
Write-Host "PLATFORM:           $env:PWSH_PLATFORM"
Write-Host "TARGET_FRAMEWORK:   $env:PWSH_TARGET_FRAMEWORK"
Write-Host "DEFINE_CONSTANTS:   $env:PWSH_DEFINE_CONSTANTS"
Write-Host "OPTIMIZE:           $env:PWSH_OPTIMIZE"

Write-Host "`n--- Target Output (Post-Build Only) ---" -ForegroundColor Yellow
Write-Host "TARGET_DIR:         $env:PWSH_TARGET_DIR"
Write-Host "TARGET_PATH:        $env:PWSH_TARGET_PATH"
Write-Host "TARGET_FILE_NAME:   $env:PWSH_TARGET_FILE_NAME"
Write-Host "TARGET_NAME:        $env:PWSH_TARGET_NAME"
Write-Host "TARGET_EXT:         $env:PWSH_TARGET_EXT"
Write-Host "OUT_DIR:            $env:PWSH_OUT_DIR"

Write-Host "`n--- Versioning ---" -ForegroundColor Yellow
Write-Host "VERSION:            $env:PWSH_VERSION"
Write-Host "ASSEMBLY_VERSION:   $env:PWSH_ASSEMBLY_VERSION"
Write-Host "FILE_VERSION:       $env:PWSH_FILE_VERSION"

Write-Host "`n--- Solution Info ---" -ForegroundColor Yellow
Write-Host "SOLUTION_DIR:       $env:PWSH_SOLUTION_DIR"
Write-Host "SOLUTION_NAME:      $env:PWSH_SOLUTION_NAME"

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
