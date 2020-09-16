resource "google_compute_network" "vpc-network" {
  name                    = var.networkname
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnetwork" {
  name                     = var.subnetworkname
  ip_cidr_range            = "10.0.0.0/18"
  network                  = google_compute_network.vpc-network.id
}