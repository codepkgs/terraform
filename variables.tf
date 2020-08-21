variable "vsphere_user" {
  type        = string
  description = "vmware vsphere vcenter or esxi username"
}

variable "vsphere_password" {
  type        = string
  description = "vmware vsphere vcenter or esxi password"
}

variable "vsphere_server" {
  type        = string
  description = "vmware vsphere vcenter or esxi host address"
}

variable "vsphere_datacenter" {
  type        = string
  description = "datacenter name, if you connect to esxi, datacenter name will be ignore"
  default     = "ha-datacenter"
}

variable "vsphere_datastore" {
  type        = string
  description = "datastore name"
  default     = "datastore1"
}

variable "vsphere_resource_pool" {
  type        = string
  description = "resource pool"
  default     = "ha-root-pool"
}

variable "vsphere_network" {
  type        = string
  description = "vsphere network name"
  default     = "VM Network"
}
