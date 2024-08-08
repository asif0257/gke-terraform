resource "google_compute_router" "nat_router" {
  name    = var.router_name
  network = var.vpc_id
  region  = var.region
  project = var.project
}

resource "google_compute_address" "address" {
  count  = 1
  name   = "nat-manual-ip-${count.index}"
  region =  var.region
  project = var.project
}


resource "google_compute_router_nat" "nat_gw" {
  project                  = var.project
  name                     = var.nat_name
  router                   = google_compute_router.nat_router.name
  region                   = var.region

  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = google_compute_address.address.*.self_link
  
  # source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = "private-subnet-1" 
    # name                    = "private-subnet-2" 
    # name                    = "private-subnet-3"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

