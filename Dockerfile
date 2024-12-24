FROM ubuntu:20.04

# Install required tools (if needed)
RUN apt-get update && apt-get install -y \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Copy the shell script into the container
COPY setup-aws-creds.sh /usr/local/bin/setup-aws-creds.sh
RUN chmod +x /usr/local/bin/setup-aws-creds.sh

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/configure-cred.sh"]
