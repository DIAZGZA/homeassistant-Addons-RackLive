ARG BUILD_FROM
FROM ${BUILD_FROM}

# Instalar dependencias del sistema requeridas
RUN apk add --no-cache \
        python3 \
        py3-pip \
        nodejs \
        npm

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el codigo fuente de la aplicacion al contenedor
COPY EnrutadorApp /app

# Instalar dependencias de Python si existe un archivo requirements.txt
RUN if [ -f requirements.txt ]; then pip3 install --no-cache-dir -r requirements.txt; fi

# Copiar el script de inicio y darle permisos de ejecucion
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
