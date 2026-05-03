#!/bin/bash
set -e

HOST="$1"
USERNAME="$2"
KEY="$3"
PORT="$4"
TIMEOUT="$5"
ENVS="$6"
SCRIPT="$7"

# Write key to file
echo "$KEY" > key.pem
chmod 600 key.pem

# Connect via SSH and run the script with environment variables
ssh -i key.pem -o StrictHostKeyChecking=no -o ConnectTimeout="$TIMEOUT" -p "$PORT" "$USERNAME@$HOST" "bash -s" <<EOF
$ENVS
$SCRIPT
EOF