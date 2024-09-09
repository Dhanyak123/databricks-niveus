variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}

variable "google_project" {
  type        = string
  description = "Google project for VCP/workspace deployment"
}

variable "google_region" {
  type        = string
  description = "Google region for VCP/workspace deployment"
}

variable "prefix" {
  type        = string
  description = "Prefix to use in generated VPC name"
}

variable "workspace_name" {
  type        = string
  description = "Name of the workspace to create"
}

variable "delegate_from" {
  description = "Identities to allow to impersonate created service account (in form of user:user.name@example.com, group:deployers@example.com or serviceAccount:sa1@project.iam.gserviceaccount.com)"
  type        = list(string)
}

variable "databricks_google_service_account" {
  type = string
  
}

variable "network_name" {
  type        = string
  description = "Name of the network to use"
}

variable "vpc_id" {
  type = string
  description = "Name of the vpc"
}

variable "subnet_id" {
  type  = string
  description = "Name of the subnet"
}

variable "pod_ip_range_name" {
  type = string
  description = "name of the pod"
}

variable "service_ip_range_name" {
  type = string
  description = "name of the service"
}

variable "network_project_id" {
  type = string
  description = "name of network project"
}

variable "subnet_region" {
  type = string
  description = "subnet region"
  
}
variable "connectivity_type" {
  type = string
}

variable "master_ip_range" {
  type = string
  
}

variable "cmek_resource_id" {
  type = string 
}

################################################################################################################
variable "cluster_name" {
    type = string
    description = "Name of the cluster"
}

variable "spark_version" {
    type = string
    description = "version of spark"
}

variable "node_type_id" {
    type = string
    description = "type of node to be used"
}

variable "autotermination_minutes" {
    type = number
}

variable "min_workers" {
    type = number
}

variable "max_workers" {
    type = number
  
}

variable "spark_conf" {
    type = map(string)
  
}

variable "databricks_host" {
  type = string
  
}

variable "databricks_google_service_account_1" {
  type = string
  
}

variable "bigquery_secret" {
  type = string
  
}

variable "bigquery_project" {
  type = string
}

#####################
variable "bigquery_name" {
    type = string
    description = "secret scope name of bigqery"
}

variable "initial_manage_principal" {
    type = string
}

variable "bigquery_key" {
    type = string
}

# variable "bigquery_string_value" {
#     type = string
# }

variable "google_project_1" {
  type = string 
}

variable "databricks_google_service_account_2" {
  type = string
}

variable "databricks_host_1" {
  type = string
}

##################################################
variable "gcs_name" {
    type = string
}

variable "location" {
    type = string
}

variable "gcs_key" {
   type = string
}

variable "gcs_scope_name" {
  type = string
}

# variable "gcs_string_value" {
#   type = string
# }

variable "databricks_host_2" {
  type = string
}

variable "databricks_google_service_account_3" {
  type = string
}

variable "google_project_2" {
  type = string
}
variable "gcs_secret" {
  type = string
  
}

variable "gcs_project" {
  type = string
}

####################################################################

