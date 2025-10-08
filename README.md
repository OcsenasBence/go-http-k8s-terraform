# Go HTTP Server Application

## Table of Contents
- [Prerequisites](#prerequisites)
- [Application Components](#application-components)
- [Setting up the Application](#setting-up-the-application)
- [Using the Application](#using-the-application)
- [Cleaning up Resources](#cleaning-up-resources)

---

## Prerequisites
Before you start, make sure you have the following installed locally:

- [Go](https://go.dev/doc/install) — to run the HTTP server locally  
- [Docker](https://docs.docker.com/get-docker/) — for containerization  
- [Minikube](https://minikube.sigs.k8s.io/docs/start/) — to run a local Kubernetes cluster  
- [kubectl](https://kubernetes.io/docs/tasks/tools/) — to interact with Kubernetes  
- [Terraform](https://developer.hashicorp.com/terraform/downloads) — to manage Kubernetes resources declaratively  

---

## Application Components

### 1. Application Files
Located inside the project root:

- **main.go** — A simple Go HTTP server that listens on port `8080` and returns `"Hello, World!"`  
- **Dockerfile** — Defines how to build the Docker image used by both the CI pipeline and Kubernetes

### 2. CI/CD Pipeline
Located inside the `.github/workflows` folder:

- **docker-publish.yml** — A GitHub Actions workflow that builds and pushes the Docker image to GitHub Container Registry (GHCR) whenever code is pushed to the repository.

### 3. Kubernetes Manifests
Located inside the `k8s/` folder:

- **deployment.yaml** — Defines the Kubernetes Deployment with two replicas of the Go HTTP server  
- **service.yaml** — Exposes the Deployment internally using a ClusterIP service on port `8080`

### 4. Terraform Configuration
Located inside the `terraform/` folder:

- **main.tf** — Defines Kubernetes resources as Terraform manifests  
- **provider.tf** — Configures the Kubernetes provider using your kubeconfig context (e.g. `minikube`)  
- **variables.tf** — Sets the container image variable for the deployment

---

## Setting up the Application

### 1. Start Minikube Cluster
The application runs inside a local Minikube cluster.  
Start Minikube using:

```bash
minikube start
2. Deploy with Kubernetes YAML
If you prefer to apply the Kubernetes manifests directly:

bash
Kód másolása
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Check the resources:

bash
Kód másolása
kubectl get pods
kubectl get svc
3. Deploy with Terraform
Alternatively, deploy the same resources via Terraform:

bash
Kód másolása
cd terraform
terraform init
terraform apply -auto-approve
Terraform will read your Kubernetes context (e.g. Minikube) and create the Deployment and Service automatically.

Using the Application
Once deployed, forward the service port to access the app locally:

bash
Kód másolása
kubectl port-forward deployment/go-http 8080:8080
Then open http://localhost:8080
You should see:

Kód másolása
Hello, World!
Cleaning up Resources
To delete all resources and stop the Minikube cluster:

bash
Kód másolása
minikube delete
This removes the Kubernetes cluster, all deployments, and services.
