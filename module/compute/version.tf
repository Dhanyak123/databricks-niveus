variable "databricks_host" {}
variable "databricks_google_service_account_1" {}
#variable "databricks_google_service_account
  

terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = ">=1.24.0" # Specify the version of the Databricks provider
    }
  }
}

# provider "databricks" {
#   alias                  = "accounts"
#   host                   = "https://accounts.gcp.databricks.com"
#   # google_service_account = "databrickss-sa2@poc-serviceproject-databricks.iam.gserviceaccount.com"
#   google_service_account = var.databricks_google_service_account
# }

provider "databricks" {
#   alias = "resources"
  host  = var.databricks_host
  google_service_account = var.databricks_google_service_account_1
}