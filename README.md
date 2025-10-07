# go-http-k8s-terraform

Simple Go HTTP server that responds with "Hello, World!" and is containerized.

## What I added

- GitHub Actions workflow to build and push the Docker image to GitHub Container Registry: `.github/workflows/docker-publish.yml`

## How to test locally

Build the binary and run locally:

```powershell
# Build
go build -o server main.go

# Run
./server
```

Build and run the Docker image locally:

```powershell
# Build image
docker build -t go-http:local .

# Run container
docker run -p 8080:8080 go-http:local
```

## CI notes

The workflow pushes images to GitHub Container Registry under `ghcr.io/<owner>/go-http-k8s-terraform` when `master` receives a push.

Ensure `GITHUB_TOKEN` or a personal access token with packages:write scope is available if you change permissions.