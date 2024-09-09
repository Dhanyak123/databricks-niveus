variable "databricks_google_service_account_4" {}
variable "google_project_3" {}
variable "databricks_host_3" {}


terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.9.0" # You can specify the latest stable version
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0.0"
    }
  }
}


provider "google" {
  project = var.google_project_3
}


provider "databricks" {
#   alias = "resources"
  host  = var.databricks_host_3
  google_service_account = var.databricks_google_service_account_4
}