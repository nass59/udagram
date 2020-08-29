# Udagram Reverse Proxy

Udagram is a simple cloud application developed alongside the Udacity Cloud Engineering Nanodegree. It allows users to register and log into a web client, post photos to the feed, and process photos using an image filtering microservice. Here is the microservice related to the Reverse Proxy.

### Prerequisite

Create a Docker Network allowing containers to communicate:

```bash
docker network create -d bridge udagram-network
```

## Run with Docker

- To build the Docker Image, run the command:

  ```bash
  make build
  ```

- To run the Docker image, run the command:

  ```bash
  make run
  ```

- You can visit `http://localhost:8080/api/v0/feed` in your web browser to verify that the application is running. You should see a JSON payload. Feel free to play around with Postman to test the API's.
