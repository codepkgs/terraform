variable "vmdk_size" {
  type        = string
  description = "vmdk size(GB)"
}

variable "vmdk_name" {
  type        = string
  description = "vmdk name, must be end of .vmdk"
}

variable "datacenter" {
  type        = string
  description = "datacenter name"
  default     = "ha-datacenter"
}

variable "datastore" {
  type        = string
  description = "datastore name"
  default     = "datastore1"
}

variable "vmdk_type" {
  type        = string
  description = "vmdk type (eagerZeroedThick, thin, lazy)"
  default     = "thin"
}
