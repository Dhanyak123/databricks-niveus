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