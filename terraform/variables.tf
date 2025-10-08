variable "image_name" {
  description = "Docker image used for the go-http deployment"
  type        = string
  default     = "ghcr.io/ocsenasbence/go-http-k8s-terraform:latest"
}
