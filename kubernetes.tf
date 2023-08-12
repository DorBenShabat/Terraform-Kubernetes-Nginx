terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

variable "host" {
  description = "Kubernetes API server URL"
  type        = string
}

variable "client_certificate" {
  description = "Client certificate for Kubernetes authentication"
  type        = string
}

variable "client_key" {
  description = "Client key for Kubernetes authentication"
  type        = string
}

variable "cluster_certificate" {
  description = "Cluster CA certificate for Kubernetes"
  type        = string
}

provider "kubernetes" {
  host                   = var.host
  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_certificate)
}
