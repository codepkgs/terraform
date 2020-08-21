terraform {
  required_version = ">= 0.13.0"
}

resource "vsphere_host_port_group" "pg" {
  name                = var.pg_name
  host_system_id      = var.host_system_id
  virtual_switch_name = var.virtual_switch_name
  vlan_id             = var.vlan_id == null || var.vlan_id < 1 || var.vlan_id > 4095 ? 0 : var.vlan_id
  allow_promiscuous   = var.promiscuous
}
