module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 18.0"

  name              = "three-tier-app"
  random_project_id = "true"
  org_id            = var.org_id
  folder_id         = var.folder_id
  billing_account   = var.billing_account

  activate_apis = [
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "servicenetworking.googleapis.com"
  ]
}
