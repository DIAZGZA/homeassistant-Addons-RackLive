#!/usr/bin/with-contenv bashio

echo "Iniciando el complemento RackLive en Espanol..."

# Apuntar a la ruta exacta donde se movió el código fuente
if [ -f "/app/EnrutadorApp/build.py" ]; then
    cd /app/EnrutadorApp
    python3 build.py
else
    echo "Error: No se encontro el script de inicio principal en /app/EnrutadorApp/build.py"
fi
