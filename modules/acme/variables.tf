variable "server_url" {
  type        = string
  description = "acme server url, default is staging"
  default     = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

variable "email_address" {
  type        = string
  description = "acme accout email address"
}

variable "dns_provider" {
  type        = string
  description = "dns provider"
}

variable "common_name" {
  type        = string
  description = "The certificate's common name, the primary domain that the certificate will be recognized for."
}

variable "san" {
  type        = list(string)
  description = "The certificate's subject alternative names, domains that this certificate will also be recognized for"
}

variable "dns_provider_config" {
  type        = map(string)
  description = "dns provider config"
  default     = null
}
