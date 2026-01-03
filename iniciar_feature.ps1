param (
    [string]$FeatureName
)

# Configuracion de Errores: Detener ejecucion si hay un error no terminante
$ErrorActionPreference = "Stop"

# --- Funciones de Utilidad ---

function Write-Output-Color {
    param ([string]$Message, [string]$Color = "Green")
    Write-Host $Message -ForegroundColor $Color
}

function Create-Directory-Safe {
    param ([string]$Path, [string]$Description)
    try {
        if (-not (Test-Path $Path)) {
            New-Item -ItemType Directory -Force -Path $Path | Out-Null
            Write-Output-Color "   [OK] Creado: $Description (${Path})" "DarkGray"
        }
        else {
            Write-Output-Color "   [SKIP] Existe: $Description (${Path})" "DarkYellow"
        }
    }
    catch {
        Write-Output-Color "   [ERROR] Fallo al crear el directorio ${Path}: $($_.Exception.Message)" "Red"
        throw
    }
}

function Create-File-With-Content {
    param ([string]$Path, [string]$Content)
    try {
        if (-not (Test-Path $Path)) {
            $Content | Out-File $Path -Encoding UTF8
            Write-Output-Color "   [OK] Archivo generado: $(Split-Path -Leaf $Path)" "DarkGreen"
        }
        else {
            Write-Output-Color "   [SKIP] El archivo ya existe: $(Split-Path -Leaf $Path)" "DarkYellow"
        }
    }
    catch {
        Write-Output-Color "   [ERROR] Fallo al crear el archivo ${Path}: $($_.Exception.Message)" "Red"
        throw
    }
}

# --- Funciones Principales ---

function Setup-Core {
    Write-Output-Color "`n==========================================" "Blue"
    Write-Output-Color " INICIO: Configuracion del Nucleo (Core)" "Blue"
    Write-Output-Color "==========================================" "Blue"

    if (-not (Test-Path "lib\core")) {
        Write-Output-Color "Creando estructura base 'core'..." "Cyan"
        
        $corePaths = @(
            "lib\core\theme",
            "lib\core\utils",
            "lib\core\constants",
            "lib\core\errors",
            "lib\core\widgets",
            "lib\core\services"
        )
        foreach ($path in $corePaths) { Create-Directory-Safe -Path $path -Description $path }

        # Crear archivos placeholder con contenido base
        Create-File-With-Content -Path "lib\core\errors\failures.dart" -Content "class Failure {}"
        
        $appThemeContent = @'
import 'package:flutter/material.dart'; final ThemeData appTheme = ThemeData();
'@
        Create-File-With-Content -Path "lib\core\theme\app_theme.dart" -Content $appThemeContent

        Write-Output-Color "Nucleo (Core) revisado/creado con exito." "Green"
    }
    else {
        Write-Output-Color "Estructura 'core' ya existente. Saltando creacion." "Green"
    }
}

function Create-Feature {
    param ([string]$name)
    Write-Output-Color "`n==========================================" "Blue"
    Write-Output-Color " INICIO: Creacion de Feature: $name " "Blue"
    Write-Output-Color "==========================================" "Blue"
    
    $basePath = "lib\features\$name"
    
    if (Test-Path $basePath) {
        Write-Output-Color " [FATAL] La feature '$name' ya existe en ${basePath}." "Red"
        exit
    }

    # --- Creacion de Directorios ---
    Write-Output-Color "`n-> Creando directorios:" "White"
    Create-Directory-Safe -Path "$basePath\domain\entities" -Description "Domain Entities"
    Create-Directory-Safe -Path "$basePath\domain\repositories" -Description "Domain Repositories"
    Create-Directory-Safe -Path "$basePath\domain\usecases" -Description "Domain UseCases"
    Create-Directory-Safe -Path "$basePath\data\models" -Description "Data Models"
    Create-Directory-Safe -Path "$basePath\data\datasources" -Description "Data DataSources"
    Create-Directory-Safe -Path "$basePath\data\repositories" -Description "Data Repositories"
    Create-Directory-Safe -Path "$basePath\presentation\screens" -Description "Presentation Screens"
    Create-Directory-Safe -Path "$basePath\presentation\widgets" -Description "Presentation Widgets"
    Create-Directory-Safe -Path "$basePath\presentation\providers" -Description "Presentation Providers"

    # --- Generacion de Archivos (Boilerplate) ---
    Write-Output-Color "`n-> Generando archivos base (.dart):" "White"
    
    # Domain Repository
    $repoContent = @"
abstract class ${name}Repository { /* Define metodos abstractos */ }
"@
    Create-File-With-Content -Path "$basePath\domain\repositories\${name}_repository.dart" -Content $repoContent

    # Data Repository Impl
    $repoImplContent = @'
import 'package:tu_app/features/FEATURENAME/domain/repositories/FEATURENAME_repository.dart'; class FEATURENAMERepositoryImpl implements FEATURENAMERepository { /* Implementa metodos */ }
'@ -replace 'FEATURENAME', $name
    Create-File-With-Content -Path "$basePath\data\repositories\${name}_repository_impl.dart" -Content $repoImplContent

    # Presentation Screen
    $screenContent = @'
import 'package:flutter/material.dart'; class FEATURENAMEScreen extends StatelessWidget { const FEATURENAMEScreen({super.key}); @override Widget build(BuildContext context) { return const Scaffold(body: Center(child: Text('FEATURENAME Feature Screen'))); } }
'@ -replace 'FEATURENAME', $name
    Create-File-With-Content -Path "$basePath\presentation\screens\${name}_screen.dart" -Content $screenContent

    Write-Output-Color "`nLa estructura Clean Architecture para '$name' ha sido generada con exito." "Green"
}

# --- Logica Principal ---
try {
    Setup-Core

    if ([string]::IsNullOrWhiteSpace($FeatureName)) {
        Write-Output-Color "`nSolo se reviso/creo el Core." "Cyan"
        Write-Output-Color "Uso para crear una feature: .\iniciar_feature.ps1 <nombre_feature>" "Cyan"
    }
    else {
        Create-Feature -name $FeatureName
    }
}
catch {
    Write-Output-Color "`nLa ejecucion del script fallo. Motivo:" "Red"
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host "Verifique los permisos de la carpeta o el nombre de la feature." -ForegroundColor Red
    exit 1
}