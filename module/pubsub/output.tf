output "pubsub_topic" {
  value = google_pubsub_topic.databricks_topic.name
}

output "pubsub_subscription" {
  value = google_pubsub_subscription.databricks_subscription.name
}