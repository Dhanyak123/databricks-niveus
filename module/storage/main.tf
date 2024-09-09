resource "google_storage_bucket" "databricks1_gcs_bucket" {
  name     = var.gcs_name
  location = var.location
  uniform_bucket_level_access = true
}

resource "databricks_secret_scope" "gcs_scope" {
  name = var.gcs_scope_name
}

resource "databricks_secret" "gcs_credentials" {
  key          = var.gcs_key
  string_value = var.gcs_string_value
  scope        = databricks_secret_scope.gcs_scope.name
}