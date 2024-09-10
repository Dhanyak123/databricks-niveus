  databricks_account_id = "90197466-4195-4fdb-885a-097030e58440"
  google_project        = "poc-serviceproject-databricks"
  google_region         = "asia-south1"
  prefix                = "data"
  workspace_name        = "terraform-test"
  connectivity_type = "PRIVATE_NODE_PUBLIC_MASTER"
  master_ip_range = "10.91.0.0/28"
  delegate_from = [ "user:dhanyashree.k@niveussolutions.com" ]
  databricks_google_service_account = "databrickss-sa2@poc-serviceproject-databricks.iam.gserviceaccount.com"
  cmek_resource_id = ""

  network_name          = "terraform-network"
  subnet_id = "terraform-subnet"
  subnet_region = "asia-south1"
  pod_ip_range_name = "pods"
  service_ip_range_name = "svc"
  vpc_id = "vpc-shared-poc-prudential"
  network_project_id = "poc-shared-vpc-433307"

  ###################################################################################################

  cluster_name = ""
  spark_version = "11.3.x-scala2.12"
  node_type_id = "e2-standard-4"
  max_workers = 3
  min_workers = 1
  spark_conf = {
    "spark.databricks.cluster.profile" = "serverless" 
    "spark.databricks.repl.allowedLanguages" = "python,sql"
  }
  autotermination_minutes = 60
  databricks_host = ""
  databricks_google_service_account_1 = "databrickss-sa2@poc-serviceproject-databricks.iam.gserviceaccount.com"

  ######################################################################################################
  bigquery_secret = ""
  bigquery_project = ""
  bigquery_name= ""
  initial_manage_principal = "users"
  bigquery_key = ""
  google_project_1 = " "
  databricks_google_service_account_2 = "databrickss-sa2@poc-serviceproject-databricks.iam.gserviceaccount.com"
  databricks_host_1 = ""
  #########################################################################################################

  gcs_secret = ""
  gcs_project = ""
  gcs_name= ""
  location = ""
  gcs_scope_name = ""
  gcs_key = ""
  databricks_host_2 = ""
  databricks_google_service_account_3 = ""
  google_project_2 = ""
#####################################################################################################


