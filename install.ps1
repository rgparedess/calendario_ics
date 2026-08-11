# install.ps1 - Script de instalación manual para calendario_ics en Windows
# Copia calendario_ics.py a un directorio en el PATH y crea un wrapper .bat.
# Opcionalmente añade el directorio al PATH del usuario.

$ErrorActionPreference = "Stop"

# Directorio de instalación (usar ~\.local\bin para evitar permisos de admin)
$InstallDir = "$env:USERPROFILE\.local\bin"
if (-not (Test-Path $InstallDir)) {
    New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
}

function Install-Script {
    param($src, $name)
    $dest = Join-Path $InstallDir $name
    Write-Host "[INFO] Instalando $name en $dest..."
    Copy-Item -Path $src -Destination $dest -Force
    # Crear un wrapper .bat que ejecute el script con Python
    $bat = Join-Path $InstallDir "$name.bat"
    "@echo off`npython `"$dest`" %*" | Out-File -FilePath $bat -Encoding ASCII
}

function Add-ToUserPath {
    param($Directory)
    $path = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($path -notlike "*$Directory*") {
        Write-Host "¿Deseas agregar $Directory al PATH de usuario para poder ejecutar los comandos desde cualquier terminal? (s/N)"
        $respuesta = Read-Host
        if ($respuesta -eq "s" -or $respuesta -eq "S") {
            $newPath = "$path;$Directory"
            [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
            Write-Host "[INFO] Directorio agregado al PATH. Reinicia la terminal para que los cambios surtan efecto."
        } else {
            Write-Host "Puedes agregarlo manualmente luego desde las variables de entorno del sistema."
        }
    } else {
        Write-Host "[INFO] El directorio ya está en el PATH."
    }
}

# Instalar calendario_ics (si existe)
if (Test-Path "calendario_ics.py") {
    Install-Script "calendario_ics.py" "calendario-cli"
} else {
    Write-Host "Advertencia: calendario_ics.py no encontrado en el directorio actual."
    exit 1
}

# Preguntar si añadir al PATH
Add-ToUserPath $InstallDir

Write-Host "[INFO] Instalación manual completada."
Write-Host "[INFO] Ahora puedes ejecutar 'calendario-cli' (o 'calendario-cli.bat') desde cualquier terminal (tras reiniciar la terminal si añadiste al PATH)."