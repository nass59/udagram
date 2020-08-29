# Udagram API User

Udagram is a simple cloud application developed alongside the Udacity Cloud Engineering Nanodegree. It allows users to register and log into a web client, post photos to the feed, and process photos using an image filtering microservice. Here is the microservice related to the Users.

### Prerequisite

Set your environment variables to the file `.env`

## Getting Started

- To download all the package dependencies, run the command:

  ```bash
  make install
  ```

- Run the application locally.

  ```bash
  npm run dev
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
