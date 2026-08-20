# Instalador para calendario-cli (ejecutable empaquetado con PyInstaller)
# Ejecutar como Administrador para añadir al PATH del sistema (opcional)

$ErrorActionPreference = "Stop"

# Directorio de instalación
$InstallDir = "$env:ProgramFiles\calendario_ics"
if (-not (Test-Path $InstallDir)) {
    New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
}

# Copiar el ejecutable
if (Test-Path ".\calendario-cli.exe") {
    Copy-Item ".\calendario-cli.exe" -Destination "$InstallDir\calendario-cli.exe" -Force
    Write-Host "[INFO] Ejecutable copiado a $InstallDir\calendario-cli.exe"
} else {
    Write-Host "[ERROR] No se encuentra 'calendario-cli.exe' en el directorio actual."
    exit 1
}

# Función para añadir al PATH de usuario (sin admin)
function Add-ToUserPath {
    param($Directory)
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($currentPath -notlike "*$Directory*") {
        Write-Host "[?] ¿Deseas añadir $Directory al PATH de usuario para ejecutar desde cualquier terminal? (s/N)"
        $respuesta = Read-Host
        if ($respuesta -eq "s" -or $respuesta -eq "S") {
            $newPath = "$currentPath;$Directory"
            [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
            Write-Host "[INFO] Directorio añadido al PATH de usuario."
            Write-Host "   Reinicia la terminal para que los cambios surtan efecto."
        } else {
            Write-Host "[INFO]  Puedes añadirlo manualmente desde las variables de entorno del sistema."
        }
    } else {
        Write-Host "[INFO]  El directorio ya está en el PATH de usuario."
    }
}

Add-ToUserPath $InstallDir

Write-Host ""
Write-Host "[INFO] Instalación completada."
Write-Host "   Ahora puedes ejecutar: calendario-cli"