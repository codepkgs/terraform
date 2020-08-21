variable "pg_name" {
  type        = string
  description = "port group name"
}

variable "host_system_id" {
  type        = string
  description = "esxi host system id"
}

variable "vlan_id" {
  type        = number
  description = "vlan id"
  default     = 0
}

variable "virtual_switch_name" {
  type        = string
  description = "virtual switch name"
  default     = "vSwitch0"
}

variable "promiscuous" {
  type        = bool
  description = "allow promiscuous"
  default     = false
}
