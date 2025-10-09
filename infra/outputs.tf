output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "docker_repo_url" {
  value = google_artifact_registry_repository.docker_repo.id
}
