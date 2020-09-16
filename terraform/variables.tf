variable "prefix" {
  description = "This is the environment where your webapp is deployed. qa, prod, or dev"
}

variable "project" { }

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "clustername" { }

variable "networkname" { }

variable "subnetworkname" { }

variable "staticipname" { }

variable "node-count" { }

variable "min-nodes" { }

variable "max-nodes" { }