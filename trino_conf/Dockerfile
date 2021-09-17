FROM openjdk:8-jre

# Update the base image OS and install wget and python
RUN apt-get update && apt-get install -y wget python less

# trino version will be passed in at build time
ARG TRINO_VERSION=361

# Set the URL to download
ENV TRINO_PKG trino-server-${TRINO_VERSION}.tar.gz
ENV TRINO_PKG_URL=https://repo1.maven.org/maven2/io/trino/trino-server/${TRINO_VERSION}/${TRINO_PKG}

ENV TRINO_CLI_JAR trino-cli-${TRINO_VERSION}-executable.jar
ENV TRINO_CLI_URL=https://repo1.maven.org/maven2/io/trino/trino-cli/${TRINO_VERSION}/${TRINO_CLI_JAR}

# Download trino and unpack it to /opt/trino
RUN curl -o /$TRINO_PKG $TRINO_PKG_URL && \
    mkdir -p /opt && \
    tar -xf ${TRINO_PKG} -C /opt && \
    rm ${TRINO_PKG} && \
    ln -s /opt/trino-server-${TRINO_VERSION} /opt/trino

# Download the trino CLI and put it in the image
RUN curl -o /$TRINO_CLI_JAR $TRINO_CLI_URL && \
    mv ${TRINO_CLI_JAR} /usr/local/bin/trino && \
    chmod +x /usr/local/bin/trino

# Copy configuration files on the host into the image
COPY etc /opt/trino/etc

# Specify the entrypoint to start
ENTRYPOINT /opt/trino/bin/launcher run
EXPOSE 8080