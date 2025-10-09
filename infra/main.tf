provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = "devops-cluster"
  location = var.zone

  initial_node_count = 2

  node_config {
    machine_type = "e2-medium"
  }

  enable_autopilot = false
}

resource "google_artifact_registry_repository" "docker_repo" {
  provider      = google
  location      = var.region
  repository_id = "demo-nodejs-repo"
  format        = "DOCKER"
}

resource "google_cloudbuild_trigger" "github_trigger" {
  name        = "nodejs-cloudbuild-trigger"
  description = "Trigger for Node.js app from GitHub"
  github {
    owner = var.github_owner
    name  = var.github_repo
    push {
      branch = "main"
    }
  }
  filename = "cloudbuild.yaml"
}
