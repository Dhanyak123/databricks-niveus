//Backend GCS bucket to store state file of service accounts
terraform {
  backend "gcs" {
    bucket = "bkt-terraform-statefile-databricks"
    prefix = "terraform/databricks/state"
  }
}
