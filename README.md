# MinIO Console with Automatic Bucket Creation

This repository provides a Docker image for MinIO Console with `mc` tool installed. The image includes functionality to automatically create public and private buckets on startup.

## Features

- MinIO Console installation
- `mc` tool installation
- Automatic creation of public and private buckets on startup
- Checks to ensure buckets are not recreated if they already exist

## Usage

### Build the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t minio-console:latest .
