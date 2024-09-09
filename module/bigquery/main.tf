resource "databricks_secret_scope" "bigquery_scope" {
  name = var.bigquery_name
  initial_manage_principal = var.initial_manage_principal
}

resource "databricks_secret" "bigquery_credentials" {
  key          = var.bigquery_key
  string_value = var.bigquery_string_value
  scope        = databricks_secret_scope.bigquery_scope.name
}




