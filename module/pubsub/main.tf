resource "google_pubsub_topic" "databricks_topic" {
  name = "databricks-topic"
}

resource "google_pubsub_topic" "my_topic" {
  name = "my-topic"
}

resource "google_pubsub_subscription" "my_subscription" {
  name  = "my-subscription"
  topic = google_pubsub_topic.my_topic.name
}


resource "google_pubsub_subscription" "databricks_subscription" {
  name  = "databricks-subscription"
  topic = google_pubsub_topic.databricks_topic.id
}


resource "databricks_cluster" "pubsub-integration-cluster" {
  cluster_name            = "pubsub-integration-cluster"
  spark_version           = "7.3.x-scala2.12"
  node_type_id            = "e2-standard-4"
  num_workers             = 2
 
  autotermination_minutes = 60
}

resource "databricks_job" "pubsub_integration_job" {
  name = "pubsub_integration_job"

  new_cluster {
    spark_version = "7.3.x-scala2.12"
    node_type_id = "e2-standard-4"
    num_workers   = 2  # 0 Required for SingleNode
    #single_node   = true  # Enable SingleNode cluster mode
    #autotermination_minutes = 60
  }

  notebook_task {
    notebook_path = "/https://1722783741738726.6.gcp.databricks.com/compute/clusters/0905-054406-gllyrt3y/notebooks?o=1722783741738726"
  }
}