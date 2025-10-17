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

output "dns_zone_name" {
  value       = google_dns_managed_zone.urquilladev.name
  description = "Nombre de la zona DNS gestionada para urquilladev.xyz"
}

output "dns_zone_nameservers" {
  value       = google_dns_managed_zone.urquilladev.name_servers
  description = "Cloud DNS Nameservers"
}

output "ssl_certificate_name" {
  value       = google_compute_managed_ssl_certificate.urquilladev_cert.name
  description = "Nombre del certificado SSL gestionado por GCP"
}

output "dns_record_ip" {
  value       = google_dns_record_set.urquilladev_a.rrdatas[0]
  description = "IP pública del Load Balancer"
}