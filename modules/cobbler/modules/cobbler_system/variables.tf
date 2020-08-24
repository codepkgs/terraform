variable "name" {
  type        = string
  description = "cobbler system name"
}

variable "hostname" {
  type        = string
  description = "cobbler system name"
}

variable "profile" {
  type        = string
  description = "the profile name of the system used"
}

variable "name_servers" {
  type        = list(string)
  description = "name servers"
  default     = null
}

variable "name_servers_search" {
  type        = list(string)
  description = "name server search"
  default     = null
}

variable "comment" {
  type        = string
  description = "the system comment"
  default     = null
}

variable "gateway" {
  type        = string
  description = "the system gateway"
  default     = null
}

variable "kernel_options" {
  type        = string
  description = "the system kernel options"
  default     = null
}

variable "kickstart" {
  type        = string
  description = "the kickstart file of the system used"
  default     = null
}

variable "netboot_enable" {
  type        = bool
  description = "(re)Install this machine at next boot."
  default     = false
}

variable "interfaces" {
  type = list(object({
    name        = string
    ip_address  = string
    netmask     = string
    static      = bool
    mac_address = string
  }))

  description = "interface config"
}
