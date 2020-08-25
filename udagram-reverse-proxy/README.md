# Udagram Reverse Proxy

Udagram is a simple cloud application developed alongside the Udacity Cloud Engineering Nanodegree. It allows users to register and log into a web client, post photos to the feed, and process photos using an image filtering microservice.

### Prerequisite

Create a Docker Network allowing containers to communicate

```bash
docker network create -d bridge udagram-network
```

## Getting Started

```bash
// Run the Docker Image on port 8080
docker run -it -p 8080:8080 --name udagram-reverse-proxy-service --network udagram-network udagram-reverse-proxy
```

You can visit `http://localhost:8080/api/v0/feed` in your web browser to verify that the reverse proxy is working. You should see a JSON payload.
