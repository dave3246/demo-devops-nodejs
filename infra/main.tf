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


provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

data "google_client_config" "default" {}

# GKE 

resource "google_container_cluster" "primary" {
  name     = "devops-cluster"
  location = var.zone

  remove_default_node_pool = true

  initial_node_count = 2

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "default_pool" {
  name       = "default-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 2

  autoscaling {
    min_node_count = 2
    max_node_count = 5
  }

  node_config {
    machine_type = "e2-medium"
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}

# Artifact Registry 

resource "google_artifact_registry_repository" "docker_repo" {
  provider      = google
  location      = var.region
  repository_id = "demo-nodejs-repo"
  format        = "DOCKER"
}

#Filestore Instance for Persistent Volume

resource "google_filestore_instance" "sqlite_instance" {
  name       = "sqlite-instance"
  zone       = "us-central1-c"
  tier       = "STANDARD"
  networks {
    network = "default"
    modes   = ["MODE_IPV4"]
  }

  file_shares {
    name       = "vol1"
    capacity_gb = 1024
  }
}

