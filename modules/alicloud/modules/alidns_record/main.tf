resource "alicloud_alidns_record" "record" {
  domain_name = var.domain_name
  rr          = var.record
  type        = upper(var.record_type)
  value       = var.record_value
  ttl         = var.record_ttl
  remark      = var.record_remark
  status      = upper(var.record_status)
  line        = var.record_line
  priority    = var.record_priority
}
