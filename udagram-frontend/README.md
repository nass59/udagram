# Udagram Frontend

Udagram is a simple cloud application developed alongside the Udacity Cloud Engineering Nanodegree. It allows users to register and log into a web client, post photos to the feed, and process photos using an image filtering microservice.

## Getting Started

- To download all the package dependencies, run the command:

  ```bash
  npm install .
  ```

- Install Ionic Framework's Command Line tools for us to build and run the application:

  ```bash
  npm install -g ionic
  ```

- Prepare your application by compiling them into static files.

  ```bash
  ionic build
  ```

- Run the application locally using files created from the `ionic build` command.

  ```bash
  ionic serve
  ```

- You can visit `http://localhost:8100` in your web browser to verify that the application is running. You should see a web interface.

## Run with Docker

- To build the Docker Image, run the command:

  ```bash
  docker build -t udagram-frontend .
  ```

- To run the Docker image, run the command:

  ```bash
  docker run -d -p 8100:8100 --name udagram-frontend-service --network udagram-network udagram-frontend
  ```

- You can visit `http://localhost:8100` in your web browser to verify that the application is running. You should see a web interface.

## Tips

1. It's useful to "lint" your code so that changes in the codebase adhere to a coding standard. This helps alleviate issues when developers use different styles of coding. `eslint` has been set up for TypeScript in the codebase for you. To lint your code, run the following:

   ```bash
   npx eslint --ext .js,.ts src/
   ```

   To have your code fixed automatically, run

   ```bash
   npx eslint --ext .js,.ts src/ --fix
   ```

2. Over time, our code will become outdated and inevitably run into security vulnerabilities. To address them, you can run:

   ```bash
   npm audit fix
   ```
