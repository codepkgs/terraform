terraform {
  required_providers {
    cobbler = {
      source = "terraform-providers/cobbler"
    }
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }
  required_version = ">= 0.13"
}
