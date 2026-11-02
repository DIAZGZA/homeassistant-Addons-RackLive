#!/usr/bin/with-contenv bashio

echo "Iniciando el complemento RackLive en Espanol..."

# 1. Buscar y ejecutar el script de compilacion del Frontend (React)
SCRIPT_PATH=$(find /app -name "build.py" | head -n 1)

if [ -n "$SCRIPT_PATH" ]; then
    echo "Compilando interfaz estatica con: $SCRIPT_PATH"
    SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
    cd "$SCRIPT_DIR"
    python3 build.py
    
    # 2. Arrancar el Backend Dinamico (API y Servidor Integrado)
    echo "Frontend compilado con éxito. Iniciando el Backend Rackd..."
    
    # Intentar arrancar como modulo de Python de forma nativa
    if [ -d "rackd" ]; then
        # Ejecutamos el servicio de backend en primer plano para mantener vivo el contenedor
        python3 -m rackd
    else
        echo "Error: No se encontro el directorio del servidor de la API (rackd)."
        exit 1
    fi
else
    echo "Error: No se encontro el archivo 'build.py' para compilar el entorno."
    exit 1
fi
