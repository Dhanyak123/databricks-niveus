module "gcp-basic" {
  source         = "../../module/sa-module"
  google_project = var.google_project
  prefix         = var.prefix
  delegate_from  = var.delegate_from
}