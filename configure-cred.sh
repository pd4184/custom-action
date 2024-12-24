#!/bin/bash

# Exit on error
set -e

# Retrieve inputs from environment variables
AWS_ACCESS_KEY_ID=${INPUT_aws-access-key-id}
AWS_SECRET_ACCESS_KEY=${INPUT_aws-secret-access-key}
AWS_REGION=${INPUT_aws-region:-us-east-1} # Default region is 'us-east-1'

# Validate inputs
if [[ -z "$AWS_ACCESS_KEY_ID" || -z "$AWS_SECRET_ACCESS_KEY" ]]; then
  echo "Error: AWS Access Key ID or Secret Access Key is missing."
  exit 1
fi

# Define AWS credentials and config file paths
AWS_DIR="$HOME/.aws"
CREDENTIALS_FILE="$AWS_DIR/credentials"
CONFIG_FILE="$AWS_DIR/config"

# Create AWS directory if it doesn't exist
mkdir -p "$AWS_DIR"

# Write the AWS credentials file
cat > "$CREDENTIALS_FILE" <<EOL
[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
EOL
ls -lart
cat "$CREDENTIALS_FILE"

# Write the AWS config file
cat > "$CONFIG_FILE" <<EOL
[default]
region = $AWS_REGION
EOL

echo "AWS credentials and configuration files have been set up successfully."
