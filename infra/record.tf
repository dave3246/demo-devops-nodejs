
variable "lb_ip_address" {
  description = "IP address of the Load Balancer"
  type        = string
}

resource "google_dns_record_set" "urquilladev_a" {
  name         = "urquilladev.xyz."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.urquilladev.name
  rrdatas      = [var.lb_ip_address]
}
