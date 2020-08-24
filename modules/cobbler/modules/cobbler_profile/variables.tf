variable "profile_name" {
  type        = string
  description = "cobbler profile name"
}

variable "profile_distro" {
  type        = string
  description = "cobbler profile distrobution"
}

variable "profile_ks" {
  type        = string
  description = "cobbler profile kickstart filename"
}

variable "profile_ns" {
  type        = list(string)
  description = "name servers list"
  default     = []
}

variable "profile_ns_search" {
  type        = list(string)
  description = "name servers search path"
  default     = []
}

variable "profile_kernel_options" {
  type        = string
  description = "kernel options"
  default     = ""
}

variable "boot_menu" {
  type        = bool
  description = "enable boot menu"
  default     = false
}

variable "profile_repos" {
  type        = list(string)
  description = "repo attached"
  default     = []
}
