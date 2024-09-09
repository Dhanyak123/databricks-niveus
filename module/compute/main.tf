resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = var.cluster_name
  spark_version           = var.spark_version
  node_type_id            = var.node_type_id
  autotermination_minutes = var.autotermination_minutes
  autoscale {
    min_workers = var.min_workers
    max_workers = var.max_workers
  }
#   spark_conf = {
#     "spark.databricks.io.cache.enabled" : true,
#     "spark.databricks.io.cache.maxDiskUsage" : "50g",
#     "spark.databricks.io.cache.maxMetaDataCache" : "1g"
#   }
spark_conf = var.spark_conf
}