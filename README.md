# Go HTTP Server – Docker · CI/CD · Kubernetes · Terraform

A complete DevOps workflow for a simple Go HTTP server — from source code to container, CI/CD automation, Kubernetes deployment, and Infrastructure as Code with Terraform.

## ⚙️ Overview

This project demonstrates:
- Building a minimal **Go web server** returning `"Hello, World!"`
- **Dockerizing** the app for consistent deployment
- Using **GitHub Actions** for automated build & release
- **Deploying** the container into a Kubernetes cluster
- Managing deployment declaratively via **Terraform**

---

## 🧩 Tech Stack

| Tool | Purpose |
|------|----------|
| **Go** | Simple HTTP server |
| **Docker** | Containerization |
| **GitHub Actions** | CI/CD automation |
| **Kubernetes** | Container orchestration |
| **Terraform** | Infrastructure as Code |

---

## 🚀 Quick Start

### 1. Run locally
```bash
go run main.go
# open http://localhost:8080 → Hello, World!
2. Build & run with Docker
bash
Kód másolása
docker build -t go-http-k8s-terraform .
docker run -p 8080:8080 go-http-k8s-terraform
3. Deploy to Kubernetes
bash
Kód másolása
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl get pods
kubectl get svc
4. Deploy with Terraform
bash
Kód másolása
cd terraform
terraform init
terraform apply -auto-approve
🧱 CI/CD
GitHub Actions automatically:

Builds the Docker image

Pushes it to GitHub Container Registry (GHCR)

Tags it with both latest and the commit SHA

Workflow file: .github/workflows/docker-publish.yml

📦 Project Structure
css
Kód másolása
.
├── main.go
├── Dockerfile
├── .github/workflows/docker-publish.yml
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
└── terraform/
    ├── main.tf
    ├── provider.tf
    └── variables.tf
🧠 Summary
✅ Go HTTP server responding on port 8080
✅ Dockerized and pushed automatically via CI/CD
✅ Deployed as Kubernetes Deployment + Service
✅ Managed declaratively using Terraform
