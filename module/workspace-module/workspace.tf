resource "databricks_mws_workspaces" "databricks_workspace" {
  provider       = databricks.accounts
  account_id     = var.databricks_account_id
  # workspace_name = "dbx-example-tf-deploy-${random_string.suffix.result}"
  workspace_name = var.workspace_name

  location = var.google_region
  cloud_resource_container {
    gcp {
      project_id = var.google_project
    }
  }

  network_id = databricks_mws_networks.databricks_network.network_id
  gke_config {
    connectivity_type = var.connectivity_type
    master_ip_range   = var.master_ip_range
  }

  token {
    comment = "Terraform token"
  }
depends_on = [databricks_mws_networks.databricks_network ]
  # this makes sure that the NAT is created for outbound traffic before creating the workspace
  # depends_on = [google_compute_router_nat.nat]
}

 