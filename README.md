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
```

### Environment Variables

Ensure the following environment variables are set:

- `USERNAME`: MinIO root username
- `PASSWORD`: MinIO root password
- `PUBLIC_BUCKET`: Name of the public bucket to create
- `PRIVATE_BUCKET`: Name of the private bucket to create
- `PORT`: Port for MinIO Console
- `CONSOLE_MINIO_SERVER`: MinIO server address (e.g., `http://localhost:9000`)

### Run the Docker Container

To run the Docker container, use the following command:

```sh
docker run -e USERNAME=<your-username> -e PASSWORD=<your-password> -e PUBLIC_BUCKET=<public-bucket> -e PRIVATE_BUCKET=<private-bucket> -e PORT=<port> -e CONSOLE_MINIO_SERVER=<minio-server> -p <host-port>:<port> minio-console:latest
```

Replace `<your-username>`, `<your-password>`, `<public-bucket>`, `<private-bucket>`, `<port>`, `<minio-server>`, and `<host-port>` with appropriate values.

## Example

```sh
docker run -e USERNAME=minioadmin -e PASSWORD=minioadmin -e PUBLIC_BUCKET=public-bucket -e PRIVATE_BUCKET=private-bucket -e PORT=9001 -e CONSOLE_MINIO_SERVER=http://localhost:9000 -p 9001:9001 minio-console:latest
```

This command will start the MinIO Console on port 9001 and automatically create the specified public and private buckets.

## License

This project is licensed under the MIT License.

