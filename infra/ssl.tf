
resource "google_compute_managed_ssl_certificate" "urquilladev_cert" {
  name = "urquilladev-ssl-cert"
  managed {
    domains = ["urquilladev.xyz"]
  }
}
