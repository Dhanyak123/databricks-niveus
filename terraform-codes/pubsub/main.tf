terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.9.0" # You can specify the latest stable version
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0.0"
    }
  }
}

provider "google" {
  project = "poc-serviceproject-databricks"
  region  = "asia-south1"
}

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

output "pubsub_topic" {
  value = google_pubsub_topic.databricks_topic.name
}

output "pubsub_subscription" {
  value = google_pubsub_subscription.databricks_subscription.name
}

provider "databricks" {
  host  = "https://1722783741738726.6.gcp.databricks.com/compute/clusters/0905-054406-gllyrt3y?o=1722783741738726"
  token = "dapie21a67fe188aaa9cd65a2066c4bb655c"
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

# spark_jar_task {
#     main_class_name = "com.example.PubSubIntegration"
#     parameters      = ["--topic", google_pubsub_topic.databricks_topic.name, "--subscription", google_pubsub_subscription.databricks_subscription.name]
#   }

}

  

resource "google_pubsub_topic_iam_binding" "pubsub_publisher_binding" {
  topic   = google_pubsub_topic.my_topic.name
  role    = "roles/pubsub.publisher"
  members = ["serviceAccount:pubsub@poc-serviceproject-databricks.iam.gserviceaccount.com"]
}


resource "google_pubsub_subscription_iam_binding" "pubsub_subscriber_binding" {
  subscription = google_pubsub_subscription.my_subscription.name
  role         = "roles/pubsub.subscriber"
  members      = ["serviceAccount:pubsub@poc-serviceproject-databricks.iam.gserviceaccount.com"]
}


# resource "google_pubsub_topic_iam_binding" "pubsub_publisher_binding" {
#   topic = google_pubsub_topic.my_topic.name

#   role    = "roles/pubsub.publisher"
#   members = ["serviceAccount:your-service-account@your-project.iam.gserviceaccount.com"]
# }

# resource "google_pubsub_subscription_iam_binding" "pubsub_subscriber_binding" {
#   subscription = google_pubsub_subscription.my_subscription.name

#   role    = "roles/pubsub.subscriber"
#   members = ["serviceAccount:your-service-account@your-project.iam.gserviceaccount.com"]
# }
