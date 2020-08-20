terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.93"
    }

    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 1.22"
    }
  }
}
