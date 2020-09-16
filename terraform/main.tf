terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"

  project = var.project
  region  = var.region
  zone    = var.zone
}

module "gke" {
  source = "./modules/gke"

  clustername = "${var.prefix}-${var.clustername}"
  location = "${var.zone}"
  networkname = "${var.prefix}-${var.networkname}"
  subnetworkname = "${var.prefix}-${var.subnetworkname}"
  staticipname = "${var.prefix}-${var.staticipname}"
  node-count="${var.node-count}"
  min-nodes="${var.min-nodes}"
  max-nodes="${var.max-nodes}"
}