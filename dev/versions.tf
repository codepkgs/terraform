terraform {
  required_providers {
    cobbler = {
      source = "terraform-providers/cobbler"
    }
    vsphere = {
      source = "hashicorp/vsphere"
      # version = "=1.16.0"
    }
  }
  required_version = ">= 0.13"
}
