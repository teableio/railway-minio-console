#!/bin/sh

# Start MinIO Console
exec console server --host 0.0.0.0 --port $PORT &

# Wait for MinIO service to be ready
while ! curl -s $CONSOLE_MINIO_SERVER/minio/health/live; do
  echo 'Waiting for MinIO to be ready...'
  sleep 2
done

# Configure mc alias
mc alias set myminio $CONSOLE_MINIO_SERVER $USERNAME $PASSWORD

# Create public bucket and set anonymous access policy (if not exists)
if ! mc ls myminio/$PUBLIC_BUCKET > /dev/null 2>&1; then
  mc mb myminio/$PUBLIC_BUCKET
  mc anonymous set public myminio/$PUBLIC_BUCKET
fi

# Create private bucket (if not exists)
if ! mc ls myminio/$PRIVATE_BUCKET > /dev/null 2>&1; then
  mc mb myminio/$PRIVATE_BUCKET
fi

# Keep the container running
tail -f /dev/null
