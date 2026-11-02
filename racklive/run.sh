#!/usr/bin/with-contenv bashio

echo "Iniciando el complemento RackLive en Espanol..."

# Buscar el archivo build.py en cualquier directorio dentro de /app
SCRIPT_PATH=$(find /app -name "build.py" | head -n 1)

if [ -n "$SCRIPT_PATH" ]; then
    echo "Script encontrado en: $SCRIPT_PATH"
    # Obtener el directorio del script y entrar en él
    SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
    cd "$SCRIPT_DIR"
    
    # Ejecutar la aplicación
    python3 build.py
else
    echo "Error: No se encontro el archivo 'build.py' en ningun directorio de /app."
    echo "Contenido actual de /app:"
    ls -R /app
fi
