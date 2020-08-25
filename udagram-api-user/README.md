# Udagram API User

Udagram is a simple cloud application developed alongside the Udacity Cloud Engineering Nanodegree. It allows users to register and log into a web client, post photos to the feed, and process photos using an image filtering microservice.

### Prerequisite

Set your environment variables to the file `.env`

## Getting Started

```bash
// Install dependencies
npm install .

// Build the Docker Image
docker build -t udagram-api-user .

// Run the Docker Image on port 8082
docker run -it -p 8082:8082 --env-file ./.env --name udagram-api-user-service --network udagram-network udagram-api-user
```

You can visit `http://localhost:8082/api/v0/user` in your web browser to verify that the application is running. You should see a JSON payload. Feel free to play around with Postman to test the API's.

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
