module "gcp-byovpc" {
  source                = "../../module/workspace-module"
  databricks_account_id = var.databricks_account_id
  google_project        = var.google_project
  google_region         = var.google_region
  prefix                = var.prefix
  workspace_name        = var.workspace_name
  delegate_from         = var.delegate_from
  databricks_google_service_account = var.databricks_google_service_account
  network_name          = var.network_name
  subnet_id = var.subnet_id
  subnet_region = var.subnet_region
  pod_ip_range_name = var.pod_ip_range_name
  service_ip_range_name = var.service_ip_range_name
  vpc_id = var.vpc_id
  network_project_id = var.network_project_id
  connectivity_type = var.connectivity_type
  master_ip_range = var.master_ip_range
}

module "compute" {
  source = "../../module/compute"
  cluster_name = var.cluster_name
  spark_version = var.spark_version
  node_type_id = var.node_type_id
  max_workers = var.max_workers
  min_workers = var.min_workers
  spark_conf = var.spark_conf
  autotermination_minutes = var.autotermination_minutes
  databricks_host = var.databricks_host
  databricks_google_service_account_1 = var.databricks_google_service_account_1
}


# data "google_secret_manager_secret_version" "bigquery" {
#   secret = var.bigquery_secret
#   project= var.bigquery_project
# }
  
module "bigquery" {
  source = "../../module/bigquery"
  bigquery_name= var.bigquery_name
  initial_manage_principal = var.initial_manage_principal
  bigquery_key = var.bigquery_key
  bigquery_string_value = data.google_secret_manager_secret_version.bigquery 
  google_project_1 = var.google_project_1
  databricks_google_service_account_2 = var.databricks_google_service_account_2
  databricks_host_1 = var.databricks_host_1
}

# data "google_secret_manager_secret_version" "storage" {
#   secret = var.gcs_secret
#   project= var.gcs_project
# }

module "storage" {
  source = "../../module/storage"
  gcs_name = var.gcs_name
  gcs_scope_name = var.gcs_scope_name
  gcs_string_value = data.google_secret_manager_secret_version.storage
  location = var.location
  gcs_key = var.gcs_key
  databricks_host_2 = var.databricks_host_2
  databricks_google_service_account_3 = var.databricks_google_service_account_3
  google_project_2 = var.google_project_2
}
