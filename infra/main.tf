terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.40"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.40"
    }
  }
}

# Providers
provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

# GKE 

resource "google_container_cluster" "primary" {
  name     = "devops-cluster"
  location = var.zone

  initial_node_count = 2

  node_config {
    machine_type = "e2-medium"
  }

  enable_autopilot = false
}


# Artifact Registry 

resource "google_artifact_registry_repository" "docker_repo" {
  provider      = google
  location      = var.region
  repository_id = "demo-nodejs-repo"
  format        = "DOCKER"
}

