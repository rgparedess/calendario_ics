#!/bin/bash
# Script de instalación manual para calendario_ics
# Copia los archivos .py a ~/.local/bin y crea wrappers ejecutables.

set -e

# Directorio de instalación (para usuario, sin sudo)
INSTALL_DIR="$HOME/.local/bin"

# Crear el directorio si no existe
mkdir -p "$INSTALL_DIR"

# Función para instalar un script
install_script() {
    local src="$1"
    local name="$2"
    local dest="$INSTALL_DIR/$name"
    
    echo "Instalando $name en $dest..."
    # Copiar el archivo .py
    cp "$src" "$dest"
    # Hacerlo ejecutable
    chmod +x "$dest"
}

# Instalar calendario_ics (si existe)
if [ -f "calendario_ics.py" ]; then
    install_script "calendario_ics.py" "calendario-cli"
else
    echo "Advertencia: calendario_ics.py no encontrado en el directorio actual."
fi

# Verificar que ~/.local/bin está en el PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo "⚠️  ~/.local/bin no está en tu PATH."
    echo "   Agrégalo con: export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo "   O añade la línea a tu ~/.bashrc"
fi

echo "✅ Instalación manual completada."
echo "Ahora puedes ejecutar 'calendario-cli'."