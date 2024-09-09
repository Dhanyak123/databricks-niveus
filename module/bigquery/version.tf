variable "databricks_google_service_account_2" {}
variable "google_project_1" {}
variable "databricks_host_1" {}


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
  project = var.google_project_1
}


provider "databricks" {
#   alias = "resources"
  host  = var.databricks_host_1
  google_service_account = var.databricks_google_service_account_2
}