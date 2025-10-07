Kubernetes deployment for go-http-k8s-terraform

This folder contains a Deployment and Service to run the Go HTTP server image published to GHCR.

Files
- `deployment.yaml` - Deployment (2 replicas) and ClusterIP Service exposing port 8080.

How to deploy (local)

1) Docker Desktop (Kubernetes enabled)
- Open Docker Desktop settings and enable Kubernetes.
- Wait for the cluster to be ready and for `kubectl` to point at it (Docker Desktop updates kubeconfig).
- Apply the manifests:
  kubectl apply -f k8s/deployment.yaml
- Port-forward to test locally:
  kubectl port-forward deployment/go-http 8080:8080
  curl http://localhost:8080/

2) kind (Kubernetes in Docker)
- Install kind: https://kind.sigs.k8s.io/
- Create a cluster:
  kind create cluster --name dev
- Use kubectl (kind configures kubeconfig automatically):
  kubectl cluster-info --context kind-dev
- Apply manifests and test:
  kubectl apply -f k8s/deployment.yaml
  kubectl port-forward deployment/go-http 8080:8080
  curl http://localhost:8080/

3) minikube
- Install minikube: https://minikube.sigs.k8s.io/
- Start:
  minikube start --driver=docker
- Apply manifests:
  kubectl apply -f k8s/deployment.yaml
- Access using minikube service (if you change Service type to NodePort) or port-forward:
  minikube service go-http --url

How to deploy (cloud)

- GKE / EKS / AKS (general steps):
  1. Provision a cluster using your cloud provider console or Terraform.
  2. Configure your local kubeconfig to point to the cluster (or use CI secrets).
  3. kubectl apply -f k8s/deployment.yaml

Notes on image pull and permissions
- The manifest references the image `ghcr.io/ocsenasbence/go-http-k8s-terraform:latest`.
- If the image is private, you'll need to create a Kubernetes `imagePullSecret` and reference it in the `Deployment` spec under `imagePullSecrets`.

Example imagePullSecret creation:
  kubectl create secret docker-registry ghcr-secret --docker-server=ghcr.io \
    --docker-username=<GH_USERNAME> --docker-password=<GHCR_PAT> --docker-email=<EMAIL>

Then add to the pod spec:
  imagePullSecrets:
  - name: ghcr-secret
