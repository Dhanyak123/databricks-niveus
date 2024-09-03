  databricks_account_id = "90197466-4195-4fdb-885a-097030e58440"
  google_project        = "poc-serviceproject-databricks"
  google_region         = "asia-south1"
  prefix                = "data"
  workspace_name        = "terraform-test"
  delegate_from = [ "user:dhanyashree.k@niveussolutions.com" ]
  databricks_google_service_account = "databrickss-sa2@poc-serviceproject-databricks.iam.gserviceaccount.com"
  



 network_name          = "terraform-network"
  subnet_id = "terraform-subnet"
  subnet_region = "asia-south1"
  pod_ip_range_name = "pods"
  service_ip_range_name = "svc"
  vpc_id = "vpc-shared-poc-prudential"
  network_project_id = "poc-shared-vpc-433307"