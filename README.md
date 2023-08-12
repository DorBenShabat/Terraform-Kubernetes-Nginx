---

# Terraform Kubernetes Project

This project sets up a Kubernetes deployment and service using Terraform. The deployment spins up an Nginx server, and the service exposes it on a specific node port.

## Prerequisites

- Terraform installed
- Access to a Kubernetes cluster (this example uses `kind`, but it can be adapted for other Kubernetes distributions)
- Ensure you have the necessary credentials to authenticate with your Kubernetes cluster

## Configuration

### Variables

Before running the Terraform scripts, you need to set the following environment variables:

- `TF_VAR_host`: The Kubernetes API server endpoint.
- `TF_VAR_client_certificate`: The client certificate for authentication.
- `TF_VAR_client_key`: The client key for authentication.
- `TF_VAR_cluster_certificate`: The cluster certificate.

These variables can be set using the following commands in your terminal:

```bash
$env:TF_VAR_host="YOUR_KUBERNETES_API_ENDPOINT"
$env:TF_VAR_client_certificate="YOUR_CLIENT_CERTIFICATE"
$env:TF_VAR_client_key="YOUR_CLIENT_KEY"
$env:TF_VAR_cluster_certificate="YOUR_CLUSTER_CERTIFICATE"
```

**Note**: Replace the placeholders (`YOUR_KUBERNETES_API_ENDPOINT`, `YOUR_CLIENT_CERTIFICATE`, etc.) with your actual values.

### Files

- `kind-config.yaml`: Configuration for the Kubernetes in Docker (kind) cluster.
- `kubernetes.tf`: Contains the Terraform provider configuration for Kubernetes.
- `resource_nginx.tf`: Defines the Nginx deployment in Kubernetes.
- `service_nginx.tf`: Defines the service to expose the Nginx deployment.
- `terraform.tfvars`: Contains default values for some of the variables.

## Deployment Steps

1. **Initialize Terraform**:

   ```bash
   terraform init
   ```

2. **Plan your deployment**:

   This step is optional but recommended. It allows you to see what changes Terraform will make before actually applying them.

   ```bash
   terraform plan
   ```

3. **Apply the configuration**:

   This will apply the changes and create/update the resources as defined in your Terraform configurations.

   ```bash
   terraform apply
   ```

   Terraform will prompt you to confirm that you want to apply the changes. Type `yes` and press enter to proceed.

## Cleanup

To destroy the resources you've created:

```bash
terraform destroy
```

---
