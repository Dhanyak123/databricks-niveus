terraform {
  required_providers {

    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.google_project

}

data "google_client_openid_userinfo" "me" {
}