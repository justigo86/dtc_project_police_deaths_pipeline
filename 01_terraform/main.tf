terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.16.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

resource "google_storage_bucket" "proj-dl-bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 90
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}


resource "google_bigquery_dataset" "proj_dataset" {
  dataset_id = var.dataset_id
  location   = var.region
}