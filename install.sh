#!/bin/bash
# Instalador para calendario-cli (ejecutable empaquetado con PyInstaller)

set -e

# Directorio de instalación (preferimos ~/.local/bin para usuario sin sudo)
INSTALL_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons"
mkdir -p "$INSTALL_DIR"

# Copiar el ejecutable (se asume que está en el directorio actual)
if [ -f "./calendario-cli" ]; then
    cp "./calendario-cli" "$INSTALL_DIR/"
    chmod +x "$INSTALL_DIR/calendario-cli"
    echo "[INFO] Ejecutable instalado en $INSTALL_DIR/calendario-cli"
else
    echo "[ERROR] No se encuentra el ejecutable 'calendario-cli' en el directorio actual."
    echo "   Asegúrate de tener el binario aquí."
    exit 1
fi

# Copiar icono a la carpeta estándar
mkdir -p "$HOME/.local/share/icons"
if [ -f "./logo/logo.png" ]; then
    cp "./logo/logo.png" "$HOME/.local/share/icons/calendario_ics.png"
fi

if [ -f "$ICON_DIR/calendario_ics.png" ]; then
    ICON_NAME="calendario_ics"
else
    ICON_NAME="calendar"
fi

# Crear archivo .desktop (usar la ruta absoluta del ejecutable)
cat > "$DESKTOP_DIR/calendario_ics.desktop" <<EOF
[Desktop Entry]
Name=Calendario ICS CLI
Comment=CLI para gestionar eventos en archivos .ics
Exec=$INSTALL_DIR/calendario-cli
Icon=$ICON_NAME
Terminal=true
Type=Application
Categories=Utility;Office;
EOF

chmod +x "$DESKTOP_DIR/calendario_ics.desktop"
echo "[INFO] Lanzador .desktop creado en $DESKTOP_DIR/calendario_ics.desktop"

# Verificar si ~/.local/bin está en el PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo "[!]  $HOME/.local/bin no está en tu PATH."
    echo "[?] ¿Deseas agregarlo permanentemente a tu ~/.bashrc? (s/N)"
    read -r respuesta
    if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
        # Detectar el archivo de configuración del shell
        if [ -f "$HOME/.bashrc" ]; then
            SHELL_RC="$HOME/.bashrc"
        elif [ -f "$HOME/.zshrc" ]; then
            SHELL_RC="$HOME/.zshrc"
        else
            SHELL_RC="$HOME/.profile"
        fi
        echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$SHELL_RC"
        echo "[INFO] PATH actualizado en $SHELL_RC. Reinicia la terminal o ejecuta 'source $SHELL_RC'."
    else
        echo "[INFO]  Puedes agregarlo manualmente con: export PATH=\"\$HOME/.local/bin:\$PATH\""
    fi
else
    echo "[INFO] $HOME/.local/bin ya está en el PATH."
fi

echo ""
echo "[INFO] Instalación completada."
echo "   Ahora puedes ejecutar: calendario-cli"