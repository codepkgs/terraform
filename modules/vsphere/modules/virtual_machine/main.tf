data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_resource_pool" "pool" {
  name          = "resource-pool-1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "host" {
  name          = var.esxi_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  for_each      = { for interface in var.network_interfaces : interface.pg_name => interface }
  name          = each.value.pg_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name                       = var.name
  resource_pool_id           = data.vsphere_resource_pool.pool.id
  datastore_id               = data.vsphere_datastore.datastore.id
  host_system_id             = data.vsphere_host.host.id
  annotation                 = var.annotation
  firmware                   = var.firmware
  num_cpus                   = var.num_cpus
  num_cores_per_socket       = var.num_cores_per_socket
  cpu_hot_add_enabled        = var.cpu_hot_add_enabled
  cpu_hot_remove_enabled     = var.cpu_hot_remove_enabled
  memory                     = var.memory * 1024
  memory_hot_add_enabled     = var.memory_hot_add_enabled
  guest_id                   = var.guest_id
  wait_for_guest_net_timeout = 0

  dynamic "disk" {
    for_each = toset(var.disks)
    content {
      label            = disk.key.label
      size             = disk.key.size
      unit_number      = disk.key.unit_number
      thin_provisioned = disk.key.thin_provisioned
    }
  }

  dynamic "network_interface" {
    for_each = var.network_interfaces
    content {
      network_id     = data.vsphere_network.network[network_interface.value.pg_name].id
      use_static_mac = network_interface.value.use_static_mac
      mac_address    = network_interface.value.mac_address != null ? network_interface.value.mac_address : null
    }
  }
}
