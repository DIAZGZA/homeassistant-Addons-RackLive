#!/usr/bin/with-contenv bashio 
echo "Iniciando el complemento RackLive en Espanol..." 
if [ -f "/app/build.py" ]; then 
    python3 /app/build.py 
else 
    echo "Error: No se encontro el script de inicio principal." 
fi 
