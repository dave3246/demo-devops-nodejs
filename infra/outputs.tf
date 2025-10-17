output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "docker_repo_url" {
  value = google_artifact_registry_repository.docker_repo.id
}

output "dns_zone_name" {
  value       = google_dns_managed_zone.urquilladev.name
  description = "Nombre de la zona DNS gestionada para urquilladev.xyz"
}

output "dns_zone_nameservers" {
  value       = google_dns_managed_zone.urquilladev.name_servers
  description = "Cloud DNS Nameservers"
}

output "dns_record_ip" {
  value       = google_dns_record_set.urquilladev_a.rrdatas[0]
  description = "IP pública del Load Balancer"
}