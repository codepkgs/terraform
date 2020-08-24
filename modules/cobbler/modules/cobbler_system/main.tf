resource "cobbler_system" "system" {
  name                = var.name
  hostname            = var.hostname != null ? var.hostname : null
  profile             = var.profile
  name_servers        = var.name_servers != null ? var.name_servers : null
  name_servers_search = var.name_servers_search != null ? var.name_servers_search : null
  comment             = var.comment != null ? var.comment : null
  gateway             = var.gateway != null ? var.gateway : null
  kernel_options      = var.kernel_options != null ? var.kernel_options : null
  kickstart           = var.kickstart != null ? var.kickstart : null
  netboot_enabled     = var.netboot_enable != null ? var.netboot_enable : null

  dynamic "interface" {
    for_each = toset(var.interfaces)
    content {
      name        = interface.key.name
      ip_address  = interface.key.ip_address
      netmask     = interface.key.netmask
      static      = interface.key.static
      mac_address = interface.key.mac_address
    }
  }
}
