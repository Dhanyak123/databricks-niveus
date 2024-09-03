resource "databricks_mws_networks" "databricks_network" {
  provider     = databricks.accounts
  account_id   = var.databricks_account_id
  network_name = var.network_name
  gcp_network_info {
    network_project_id    = var.network_project_id
    vpc_id                = var.vpc_id
    subnet_id             = var.subnet_id
    subnet_region         = var.subnet_region
    pod_ip_range_name     = var.pod_ip_range_name
    service_ip_range_name = var.service_ip_range_name
  }
}