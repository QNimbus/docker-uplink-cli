FROM alpine:latest

WORKDIR /app

# Install packages
RUN apk add --no-cache \
    sudo \
    curl \
    unzip

# Clean up
RUN rm -rf /var/cache/apk/*

RUN curl -L https://github.com/storj/storj/releases/latest/download/uplink_linux_amd64.zip -o uplink_linux_amd64.zip
RUN unzip -o uplink_linux_amd64.zip
RUN rm uplink_linux_amd64.zip
RUN sudo install uplink /usr/local/bin/uplink

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/uplink"]

# Default command
CMD ["version"]
