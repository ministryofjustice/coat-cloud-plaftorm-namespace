output "namespace_name" {
  value = kubernetes_namespace.example.metadata[0].name
}

output "ecr_repo_url" {
  value = module.ecr.repo_url
}
