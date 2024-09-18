FROM golang:1.22.2

ARG CONSOLE_VERSION="latest"

# Install MinIO Console
RUN go install github.com/minio/console/cmd/console@${CONSOLE_VERSION}

# Download and install mc tool
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/bin/mc && \
    chmod +x /usr/bin/mc

# Copy entrypoint script
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
