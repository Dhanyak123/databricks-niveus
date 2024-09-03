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
}





  
