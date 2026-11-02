ARG BUILD_FROM
FROM $BUILD_FROM
RUN \\
    apk add --no-cache \\
        python3 \\
        py3-pip \\
        nodejs \\
        npm
WORKDIR /app
COPY EnrutadorApp /app
RUN \\
    if [ -f requirements.txt ]; then \\
        pip3 install --no-cache-dir -r requirements.txt; \\
    fi
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
