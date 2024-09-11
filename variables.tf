variable "namespace_name" {
  description = "Name of the Kubernetes namespace"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., development, staging, production)"
  type        = string
}

variable "is_production" {
  description = "Boolean flag to indicate if this is a production environment"
  type        = bool
}

variable "business_unit" {
  description = "Business unit responsible for the service"
  type        = string
  default     = "Platforms"
}

variable "slack_channel" {
  description = "Slack channel for notifications"
  type        = string
  default     = "#operations-engieering"
}

variable "application" {
  description = "Application name"
  type        = string
}

variable "owner" {
  description = "Email or contact info of the application owner"
  type        = string
  default     = "operations-engineering@digital.justice.gov.uk"
}

variable "source_code" {
  description = "URL of the source code repository"
  type        = string
}

variable "team_name" {
  description = "Development team responsible for the service"
  type        = string
  default     = "Operations Engineering"
}

variable "rbac_group" {
  description = "Group name for RBAC role bindings"
  type        = string
  default     = "github:operations-engineering"
}
