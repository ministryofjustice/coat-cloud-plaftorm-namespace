# Terraform Cloud Platform Namespace Module

This Terraform module provisions a Kubernetes namespace, along with RBAC role bindings, LimitRange, ResourceQuota, and NetworkPolicy. It provides a way to easily set up a Kubernetes namespace with configurable limits and policies, as well as RBAC settings for administrative access.

## Features

- Creates a Kubernetes namespace with annotations and labels.
- Sets up RBAC role bindings for administrative access.
- Configures resource limits for containers within the namespace.
- Defines quotas for the maximum number of pods.
- Applies a default network policy to control ingress traffic.

## Usage

```hcl
module "namespace" {
  source = "./terraform-module"

  namespace_name = "my-namespace"
  environment    = "development"
  is_production  = false
  application    = "Join a Ministry of Justice GitHub Org"
  source_code    = "https://github.com/ministryofjustice/operations-engineering-join-github"
}
```
```
<!-- BEGIN_TF_DOCS --> 


<!-- END_TF_DOCS -->
```
