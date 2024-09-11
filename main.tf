# Create the namespace
resource "kubernetes_namespace" "example" {
  metadata {
    name = var.namespace_name
    labels = {
      "cloud-platform.justice.gov.uk/is-production"    = var.is_production
      "cloud-platform.justice.gov.uk/environment-name" = var.environment
    }
    annotations = {
      "cloud-platform.justice.gov.uk/business-unit" = var.business_unit
      "cloud-platform.justice.gov.uk/slack-channel" = var.slack_channel
      "cloud-platform.justice.gov.uk/application"   = var.application
      "cloud-platform.justice.gov.uk/owner"         = var.owner
      "cloud-platform.justice.gov.uk/source-code"   = var.source_code
      "cloud-platform.justice.gov.uk/team-name"     = var.team_name
    }
  }
}

# Example for RBAC RoleBinding
resource "kubernetes_role_binding" "example" {
  metadata {
    name      = "${var.namespace_name}-admin"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  role_ref {
    kind      = "ClusterRole"
    name      = "admin"
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = var.rbac_group
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_limit_range" "example" {
  metadata {
    name      = "limitrange"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    limit {
      default = {
        cpu    = var.default_cpu
        memory = var.default_memory
      }
      default_request = {
        cpu    = var.request_cpu
        memory = var.request_memory
      }
      type = "Container"
    }
  }
}

resource "kubernetes_resource_quota" "example" {
  metadata {
    name      = "namespace-quota"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    hard = {
      pods = var.pod_limit
    }
  }
}

resource "kubernetes_network_policy" "default" {
  metadata {
    name      = "default"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    pod_selector {}
    policy_types = ["Ingress"]

    ingress {
      from {
        pod_selector {}
      }
    }
  }
}
