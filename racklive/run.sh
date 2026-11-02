#!/usr/bin/with-contenv bashio

echo "Iniciando el complemento RackLive en Espanol..."

# 1. Buscar el script compilador original (build.py)
SCRIPT_PATH=$(find /app -name "build.py" | head -n 1)

if [ -n "$SCRIPT_PATH" ]; then
    echo "Compilando interfaz con: $SCRIPT_PATH"
    SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
    
    # Entrar a la carpeta raíz del proyecto donde está build.py
    cd "$SCRIPT_DIR"
    
    # Ejecutar la compilación nativa de la app
    python3 build.py
    
    # 2. Levantar el servidor web exactamente en esta misma carpeta raíz
    echo "Servidor RackLive listo. Levantando servidor web en el puerto 8000..."
    python3 -m http.server 8000
else
    echo "Error: No se encontro el archivo 'build.py'."
    exit 1
fi
