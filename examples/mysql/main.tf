module "three_tier_app" {
  source  = "GoogleCloudPlatform/three-tier-web-app/google"
  version = "~> 0.1"

  project_id      = var.project_id
  database_type   = "mysql"
  deployment_name = "three-tier-mysql"
  region          = "us-central1"
  zone            = "us-central1-a"
}