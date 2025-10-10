# Demo Devops NodeJs

This is a simple application to be used in the technical test of DevOps.

## Getting Started

### Prerequisites

- Node.js 18.15.0

### Installation

Clone this repo.

```bash
git clone https://bitbucket.org/devsu/demo-devops-nodejs.git
```

Install dependencies.

```bash
npm i
```

### Database

The database is generated as a file in the main path when the project is first run, and its name is `dev.sqlite`.

Consider giving access permissions to the file for proper functioning.

## Usage

To run tests you can use this command.

```bash
npm run test
```

To run locally the project you can use this command.

```bash
npm run start
```

Open http://localhost:8000/api/users with your browser to see the result.

### Features

These services can perform,

#### Create User

To create a user, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: POST
```

```json
{
    "dni": "dni",
    "name": "name"
}
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "error": "error"
}
```

#### Get Users

To get all users, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
[
    {
        "id": 1,
        "dni": "dni",
        "name": "name"
    }
]
```

#### Get User

To get an user, the endpoint **/api/users/<id>** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the user id does not exist, we will receive status 404 and the following message:

```json
{
    "error": "User not found: <id>"
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "errors": [
        "error"
    ]
}
```

## License

Copyright © 2023 Devsu. All rights reserved.


# ________________________
# RESOLUTION
# ________________________


## Architecture

- A GKE cluster for container orchestration.
- Artifact Registry for storing Docker images.
- A Kubernetes LoadBalancer service exposing the Node.js application.
- Integration with Cloud Build for CI/CD pipeline execution.

## CI/CD Pipeline

The CI/CD pipeline is implemented using **Cloud Build** and includes the following stages:

1. **Install dependencies**: Runs `npm install` to prepare the environment.
2. **Run tests**: Executes `npm run test` to validate the application.
3. **Static analysis**: Ensures code quality and standards.
4. **Dockerization**: Builds a Docker image and pushes it to **Artifact Registry**.
5. **Deployment**: Applies Kubernetes manifests to deploy the application to **GKE**.

This pipeline ensures automated testing, packaging, and deployment with every code change.

---

## Dockerization

The application is containerized using Docker. The Dockerfile includes:

- Node.js 18 base image.
- Installation of dependencies.
- Exposure of port 8000.
- Execution of the application using `npm run start`.

The image is built and pushed to **Artifact Registry** during the CI/CD pipeline.

---

## Infrastructure Deployment with Terraform

The infrastructure is provisioned using **Terraform**, including:

- GKE cluster creation.
- Artifact Registry setup.
- Kubernetes service of type LoadBalancer.
- Providers for Google Cloud and Kubernetes.

Outputs such as cluster endpoint, name, repository URL, and LoadBalancer IP are exposed using `outputs.tf`.

