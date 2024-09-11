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

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_limit_range.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/limit_range) | resource |
| [kubernetes_namespace.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_network_policy.default](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_resource_quota.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/resource_quota) | resource |
| [kubernetes_role_binding.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Application name | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | Business unit responsible for the service | `string` | `"Platforms"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g., development, staging, production) | `string` | n/a | yes |
| <a name="input_is_production"></a> [is\_production](#input\_is\_production) | Boolean flag to indicate if this is a production environment | `bool` | n/a | yes |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Name of the Kubernetes namespace | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Email or contact info of the application owner | `string` | `"operations-engineering@digital.justice.gov.uk"` | no |
| <a name="input_rbac_group"></a> [rbac\_group](#input\_rbac\_group) | Group name for RBAC role bindings | `string` | `"github:operations-engineering"` | no |
| <a name="input_slack_channel"></a> [slack\_channel](#input\_slack\_channel) | Slack channel for notifications | `string` | `"#operations-engieering"` | no |
| <a name="input_source_code"></a> [source\_code](#input\_source\_code) | URL of the source code repository | `string` | n/a | yes |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | Development team responsible for the service | `string` | `"Operations Engineering"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repo_url"></a> [ecr\_repo\_url](#output\_ecr\_repo\_url) | n/a |
| <a name="output_namespace_name"></a> [namespace\_name](#output\_namespace\_name) | n/a |
<!-- END_TF_DOCS -->
