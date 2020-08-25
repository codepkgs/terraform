variable "domain_name" {
  type        = string
  description = "alidns domain name"
}

variable "record" {
  type        = string
  description = "Host record for the domain record"
}

variable "record_type" {
  type        = string
  description = "record type"
}

variable "record_value" {
  type        = string
  description = "record value"
}

variable "record_remark" {
  type        = string
  description = "record remark"
  default     = null
}

variable "record_status" {
  type        = string
  description = "record status (ENABLE or DISABLE)"
  default     = "ENABLE"
}
variable "record_line" {
  type        = string
  description = "The resolution line of domain record"
  default     = null
}

variable "record_priority" {
  type        = string
  description = "The priority of domain record. Valid values: [1-10]"
  default     = null
}

variable "record_ttl" {
  type        = string
  description = "The effective time of domain record"
  default     = "600"
}
