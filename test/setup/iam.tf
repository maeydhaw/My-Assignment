locals {
  int_required_roles = [
    "roles/artifactregistry.admin",
    "roles/cloudsql.admin",
    "roles/compute.networkAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountUser",
    "roles/redis.admin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/run.admin",
    "roles/servicenetworking.serviceAgent",
    "roles/serviceusage.serviceUsageViewer",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/vpcaccess.admin"
  ]
}

resource "google_service_account" "int_test" {
  project      = module.project.project_id
  account_id   = "ci-account"
  display_name = "ci-account"
}

resource "google_project_iam_member" "int_test" {
  count = length(local.int_required_roles)

  project = module.project.project_id
  role    = local.int_required_roles[count.index]
  member  = "serviceAccount:${google_service_account.int_test.email}"
}

resource "google_service_account_key" "int_test" {
  service_account_id = google_service_account.int_test.id
}
