# resource "google_project" "my_project" {
#   name       = "asif-praveen-gke"
#   project_id = "asif-praveen-gke"
  
# }

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  project = var.project
  auto_create_subnetworks = false
}
