FROM ubuntu:20.04

# Install required tools (if needed)
RUN apt-get update && apt-get install -y \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Copy the shell script into the container
COPY configure-cred.sh /usr/local/bin/configure-cred.sh
RUN chmod +x /usr/local/bin/configure-cred.sh

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/configure-cred.sh"]
