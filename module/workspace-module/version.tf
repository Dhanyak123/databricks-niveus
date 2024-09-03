# variable "databricks_account_id" {}
variable "databricks_google_service_account" {}
variable "google_project" {}
# variable "google_region" {}


terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
      version = ">=1.24.0"
    }
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.google_project
}


provider "databricks" {
  alias                  = "accounts"
  host                   = "https://accounts.gcp.databricks.com"
  # google_service_account = "databrickss-sa2@poc-serviceproject-databricks.iam.gserviceaccount.com"
  google_service_account = var.databricks_google_service_account
}