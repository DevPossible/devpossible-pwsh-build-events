# DevPossible.PwshBuildEvents

A lightweight NuGet package that enables PowerShell Core (pwsh.exe) pre-build and post-build scripts for .NET projects.

## Overview

This package automatically hooks into the MSBuild process to execute PowerShell scripts located in your project's `Properties` folder:

- `Properties/prebuild.ps1` - Executed before compilation
- `Properties/postbuild.ps1` - Executed after successful compilation

**Key Features:**
- **Sample scripts included** - Template scripts are added to your project on install
- Zero configuration required - just customize the scripts
- Clean install/uninstall - no modifications to your project file
- Non-invasive - works alongside existing `<PreBuildEvent>` and `<PostBuildEvent>` targets
- **37 MSBuild properties** available via environment variables (same as VS build event macros)

## Installation

```bash
dotnet add package DevPossible.PwshBuildEvents
```

On installation, sample scripts are added to your `Properties/` folder:
- `Properties/prebuild.ps1` - Template for pre-build tasks
- `Properties/postbuild.ps1` - Template for post-build tasks

> **Note:** These files remain in your project if you uninstall the package - delete them manually if not needed.

## Usage

### Quick Start

The sample scripts are ready to use. Just customize them with your build logic:

**Properties/prebuild.ps1**
```powershell
# Build properties are available via environment variables (prefixed with PWSH_)
$ProjectDir      = $env:PWSH_PROJECT_DIR
$ProjectName     = $env:PWSH_PROJECT_NAME
$Configuration   = $env:PWSH_CONFIGURATION
$TargetFramework = $env:PWSH_TARGET_FRAMEWORK

Write-Host "Running pre-build for $ProjectName ($Configuration)"
# Your pre-build logic here
```

**Properties/postbuild.ps1**
```powershell
# Build properties are available via environment variables (prefixed with PWSH_)
$ProjectDir      = $env:PWSH_PROJECT_DIR
$ProjectName     = $env:PWSH_PROJECT_NAME
$Configuration   = $env:PWSH_CONFIGURATION
$TargetFramework = $env:PWSH_TARGET_FRAMEWORK
$TargetDir       = $env:PWSH_TARGET_DIR
$TargetPath      = $env:PWSH_TARGET_PATH

Write-Host "Running post-build for $ProjectName ($Configuration)"
# Your post-build logic here
```

### 2. Build your project

The scripts execute automatically during `dotnet build`:

```bash
dotnet build
```

Output:
```
Running pre-build for MyProject (Debug)
  MyProject -> C:\Projects\MyProject\bin\Debug\net8.0\MyProject.dll
Running post-build for MyProject (Debug)
```

## Available Environment Variables

All MSBuild properties are passed to your scripts via environment variables (prefixed with `PWSH_`). This mirrors the macros available in Visual Studio's built-in build events.

### Project Information

| Environment Variable | Description | Example |
|---------------------|-------------|---------|
| `PWSH_PROJECT_DIR` | Project root directory | `C:\Projects\MyApp` |
| `PWSH_PROJECT_NAME` | Project name | `MyApp` |
| `PWSH_PROJECT_PATH` | Full path to project file | `C:\Projects\MyApp\MyApp.csproj` |
| `PWSH_PROJECT_FILE_NAME` | Project file name | `MyApp.csproj` |
| `PWSH_PROJECT_EXT` | Project file extension | `.csproj` |
| `PWSH_ASSEMBLY_NAME` | Assembly name | `MyApp` |
| `PWSH_ROOT_NAMESPACE` | Root namespace | `MyApp` |
| `PWSH_OUTPUT_TYPE` | Output type | `Exe`, `Library` |

### Build Configuration

| Environment Variable | Description | Example |
|---------------------|-------------|---------|
| `PWSH_CONFIGURATION` | Build configuration | `Debug`, `Release` |
| `PWSH_PLATFORM` | Platform | `AnyCPU`, `x64` |
| `PWSH_PLATFORM_TARGET` | Platform target | `AnyCPU`, `x64` |
| `PWSH_TARGET_FRAMEWORK` | Target framework | `net8.0` |
| `PWSH_TARGET_FRAMEWORKS` | All target frameworks (comma-separated) | `net6.0,net8.0` |
| `PWSH_RUNTIME_IDENTIFIER` | Runtime identifier | `win-x64`, `linux-x64` |
| `PWSH_DEFINE_CONSTANTS` | Defined constants (comma-separated) | `DEBUG,TRACE` |
| `PWSH_OPTIMIZE` | Optimization enabled | `true`, `false` |
| `PWSH_DEBUG_TYPE` | Debug symbol type | `portable`, `full` |
| `PWSH_DEBUG_SYMBOLS` | Debug symbols enabled | `true`, `false` |
| `PWSH_LANGVERSION` | C# language version | `12.0`, `latest` |
| `PWSH_NULLABLE` | Nullable context | `enable`, `disable` |
| `PWSH_IMPLICIT_USINGS` | Implicit usings | `enable`, `disable` |

### Output Paths

| Environment Variable | Description | Available |
|---------------------|-------------|-----------|
| `PWSH_OUT_DIR` | Output directory | Both |
| `PWSH_BASE_OUTPUT_PATH` | Base output path (bin/) | Both |
| `PWSH_INTERMEDIATE_OUTPUT_PATH` | Intermediate path (obj/) | Both |
| `PWSH_BASE_INTERMEDIATE_OUTPUT_PATH` | Base intermediate path | Both |
| `PWSH_TARGET_DIR` | Target output directory | **Post-build only** |
| `PWSH_TARGET_PATH` | Full path to output assembly | **Post-build only** |
| `PWSH_TARGET_FILE_NAME` | Output file name with extension | **Post-build only** |
| `PWSH_TARGET_NAME` | Output file name without extension | **Post-build only** |
| `PWSH_TARGET_EXT` | Output file extension | **Post-build only** |

### Solution Information

| Environment Variable | Description | Example |
|---------------------|-------------|---------|
| `PWSH_SOLUTION_DIR` | Solution directory | `C:\Projects\` |
| `PWSH_SOLUTION_NAME` | Solution name | `MySolution` |
| `PWSH_SOLUTION_PATH` | Full path to solution file | `C:\Projects\MySolution.sln` |
| `PWSH_SOLUTION_FILE_NAME` | Solution file name | `MySolution.sln` |
| `PWSH_SOLUTION_EXT` | Solution file extension | `.sln` |

### Versioning

| Environment Variable | Description | Example |
|---------------------|-------------|---------|
| `PWSH_VERSION` | Package/assembly version | `1.0.0` |
| `PWSH_ASSEMBLY_VERSION` | Assembly version | `1.0.0.0` |
| `PWSH_FILE_VERSION` | File version | `1.0.0.0` |
| `PWSH_INFORMATIONAL_VERSION` | Informational version | `1.0.0+abc123` |
| `PWSH_PACKAGE_VERSION` | NuGet package version | `1.0.0` |

> **Note:** Variables containing semicolons (like `DefineConstants` and `TargetFrameworks`) are automatically converted to comma-separated values.

### MSBuild Macro Comparison

If you're migrating from Visual Studio's built-in build events, here's how the macros map:

| VS Build Event Macro | Environment Variable |
|---------------------|---------------------|
| `$(ProjectDir)` | `$env:PWSH_PROJECT_DIR` |
| `$(ProjectName)` | `$env:PWSH_PROJECT_NAME` |
| `$(ProjectPath)` | `$env:PWSH_PROJECT_PATH` |
| `$(ProjectFileName)` | `$env:PWSH_PROJECT_FILE_NAME` |
| `$(Configuration)` | `$env:PWSH_CONFIGURATION` |
| `$(Platform)` | `$env:PWSH_PLATFORM` |
| `$(TargetDir)` | `$env:PWSH_TARGET_DIR` |
| `$(TargetPath)` | `$env:PWSH_TARGET_PATH` |
| `$(TargetFileName)` | `$env:PWSH_TARGET_FILE_NAME` |
| `$(TargetName)` | `$env:PWSH_TARGET_NAME` |
| `$(TargetExt)` | `$env:PWSH_TARGET_EXT` |
| `$(OutDir)` | `$env:PWSH_OUT_DIR` |
| `$(SolutionDir)` | `$env:PWSH_SOLUTION_DIR` |
| `$(SolutionName)` | `$env:PWSH_SOLUTION_NAME` |
| `$(SolutionPath)` | `$env:PWSH_SOLUTION_PATH` |

## Common Examples

### Copy output to a shared folder (postbuild.ps1)

```powershell
$destination = "\\server\builds\$env:PWSH_PROJECT_NAME\$env:PWSH_CONFIGURATION"
if (-not (Test-Path $destination)) {
    New-Item -ItemType Directory -Path $destination -Force | Out-Null
}
Copy-Item $env:PWSH_TARGET_PATH -Destination $destination -Force
Write-Host "Copied to $destination"
```

### Generate build info file (prebuild.ps1)

```powershell
$buildInfo = @{
    BuildTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Configuration = $env:PWSH_CONFIGURATION
    Framework = $env:PWSH_TARGET_FRAMEWORK
    Version = $env:PWSH_VERSION
    Machine = $env:COMPUTERNAME
    User = $env:USERNAME
}
$buildInfo | ConvertTo-Json | Set-Content "$env:PWSH_PROJECT_DIR\BuildInfo.json"
```

### Run only in Release mode (postbuild.ps1)

```powershell
if ($env:PWSH_CONFIGURATION -ne 'Release') {
    Write-Host "Skipping - Release build only"
    exit 0
}

# Your release-only logic here
Write-Host "Running release post-build tasks..."
```

### Copy additional files to output (postbuild.ps1)

```powershell
# Copy config files
Copy-Item "$env:PWSH_PROJECT_DIR\config\*.json" -Destination $env:PWSH_TARGET_DIR -Force

# Copy native DLLs
$nativeDir = "$env:PWSH_PROJECT_DIR\native\$env:PWSH_PLATFORM"
if (Test-Path $nativeDir) {
    Copy-Item "$nativeDir\*.dll" -Destination $env:PWSH_TARGET_DIR -Force
}
```

### Validate prerequisites (prebuild.ps1)

```powershell
$ErrorActionPreference = 'Stop'

# Check required tools
if (-not (Get-Command 'node' -ErrorAction SilentlyContinue)) {
    throw "Node.js is required but not found in PATH"
}

# Check required environment variables
@('API_KEY', 'DATABASE_URL') | ForEach-Object {
    if (-not (Get-Item "env:$_" -ErrorAction SilentlyContinue)) {
        Write-Warning "$_ environment variable is not set"
    }
}
```

## How It Works

This package uses MSBuild's native extensibility model:

1. **NuGet Auto-Import**: The package includes a `.targets` file in the `build/` folder that NuGet automatically imports into consuming projects
2. **Conditional Execution**: Targets only execute when the corresponding script file exists
3. **Build Hooks**: Uses `BeforeTargets="BeforeBuild"` and `AfterTargets="Build"` to inject into the build pipeline

### Why This Approach?

| Approach | Pros | Cons |
|----------|------|------|
| **`.targets` file (this package)** | Clean install/uninstall, no project file changes, works with PackageReference | Requires NuGet package |
| `<PreBuildEvent>/<PostBuildEvent>` | Built-in, no package needed | Modifies project file, conflicts with existing events |
| `Directory.Build.targets` | Works across all projects | Requires manual setup, not portable |

## Configuration Options

You can customize behavior by setting MSBuild properties in your project file:

```xml
<PropertyGroup>
  <!-- Disable all pwsh build events -->
  <PwshBuildEventsEnabled>false</PwshBuildEventsEnabled>

  <!-- Custom script folder (default: Properties) -->
  <PwshBuildEventsFolder>BuildScripts</PwshBuildEventsFolder>

  <!-- Custom PowerShell executable (default: pwsh) -->
  <PwshExecutable>pwsh.exe</PwshExecutable>

  <!-- Disable auto-copy of sample scripts on first build (default: true) -->
  <PwshBuildEventsCopySamples>false</PwshBuildEventsCopySamples>
</PropertyGroup>
```

### Configuration Summary

| Property | Default | Description |
|----------|---------|-------------|
| `PwshBuildEventsEnabled` | `true` | Enable/disable all build events |
| `PwshBuildEventsFolder` | `Properties` | Folder containing the scripts |
| `PwshExecutable` | `pwsh` | PowerShell executable to use |
| `PwshBuildEventsCopySamples` | `true` | Auto-copy sample scripts on first build |

## Requirements

- .NET SDK 6.0 or later
- PowerShell Core 7.0+ (`pwsh.exe`) installed and available in PATH

## Troubleshooting

### Scripts not running?

1. Verify `pwsh.exe` is in your PATH: `pwsh --version`
2. Ensure scripts are in the correct location: `Properties/prebuild.ps1` or `Properties/postbuild.ps1`
3. Check the script filename is exactly `prebuild.ps1` or `postbuild.ps1` (case-insensitive on Windows)
4. If you manually created the scripts (didn't use the auto-generated samples), ensure they are not blocked - see below

### Execution Policy or Blocked Scripts?

This package runs scripts with `-ExecutionPolicy Bypass`, which handles most execution policy restrictions. However, if you're experiencing issues:

**Check if your scripts are blocked:**
```powershell
Get-Item Properties\*.ps1 | Get-Item -Stream Zone.Identifier -ErrorAction SilentlyContinue
```

If you see output mentioning `ZoneId=3` (Internet Zone), unblock the scripts:
```powershell
Unblock-File -Path Properties\prebuild.ps1
Unblock-File -Path Properties\postbuild.ps1
```

**Group Policy restrictions:**
If your organization enforces a strict execution policy via Group Policy, the `-ExecutionPolicy Bypass` flag used by this package should still work. However, if scripts still don't run, contact your IT administrator.

> **Note:** Scripts auto-generated from the NuGet package sample files are never blocked because they are extracted locally, not downloaded from the internet.

### Build fails with script error?

The build will fail if your script exits with a non-zero exit code. To allow the build to continue despite script errors:

```powershell
# At the end of your script
exit 0
```

### View detailed output

Run with increased verbosity:
```bash
dotnet build -v detailed
```

## Uninstalling

Simply remove the package:
```bash
dotnet remove package DevPossible.PwshBuildEvents
```

The `.targets` file is automatically removed from the build process. Your scripts in `Properties/` remain unchanged.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

MIT License - see [LICENSE](LICENSE) file for details.

## References

- [MSBuild props and targets in a package](https://learn.microsoft.com/en-us/nuget/concepts/msbuild-props-and-targets)
- [Extending the Visual Studio build process](https://learn.microsoft.com/en-us/visualstudio/msbuild/how-to-extend-the-visual-studio-build-process)
- [MSBuild target build order](https://learn.microsoft.com/en-us/visualstudio/msbuild/target-build-order)
