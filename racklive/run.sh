#!/usr/bin/with-contenv bashio

echo "Iniciando el complemento RackLive en Espanol..."

# 1. Buscar y ejecutar el script compilador original (build.py)
SCRIPT_PATH=$(find /app -name "build.py" | head -n 1)

if [ -n "$SCRIPT_PATH" ]; then
    echo "Compilando interfaz con: $SCRIPT_PATH"
    SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
    cd "$SCRIPT_DIR"
    python3 build.py
    
    # 2. Levantar un servidor web permanente para Home Assistant
    echo "Servidor RackLive listo. Levantando servidor web en el puerto 8000..."
    # Buscamos la carpeta donde se generaron los archivos web (usualmente la raíz del código o la carpeta 'web')
    if [ -d "web" ]; then
        cd web
    fi
    
    # Iniciamos el servidor HTTP integrado de Python de forma permanente
    python3 -m http.server 8000
else
    echo "Error: No se encontro el archivo 'build.py'."
    exit 1
fi
