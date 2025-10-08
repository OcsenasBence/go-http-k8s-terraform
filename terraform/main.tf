locals {
  deployment_yaml = file("${path.module}/../k8s/deployment.yaml")
  service_yaml    = file("${path.module}/../k8s/service.yaml")
}

resource "kubernetes_manifest" "deployment" {
  manifest = yamldecode(local.deployment_yaml)
}

resource "kubernetes_manifest" "service" {
  manifest = yamldecode(local.service_yaml)
}
