output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "docker_repo_url" {
  value = google_artifact_registry_repository.docker_repo.id
}

output "load_balancer_ip" {
  value = kubernetes_service.node_app_lb.status[0].load_balancer[0].ingress[0].ip
}
