
resource "google_dns_managed_zone" "urquilladev" {
  name        = "urquilladev-zone"
  dns_name    = "urquilladev.xyz."
  description = "Zona DNS para urquilladev"
}
