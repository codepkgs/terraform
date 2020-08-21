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

data "vsphere_datastore" "cdrom_datastore" {
  name          = var.cdrom_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "host" {
  name          = var.esxi_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  count         = var.network_interfaces != null ? length(var.network_interfaces) : 0
  name          = var.network_interfaces[count.index]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "this" {
  name                   = var.name
  resource_pool_id       = data.vsphere_resource_pool.pool.id
  datastore_id           = data.vsphere_datastore.datastore.id
  host_system_id         = data.vsphere_host.host.id
  annotation             = var.annotation
  firmware               = var.firmware
  num_cpus               = var.num_cpus
  num_cores_per_socket   = var.num_cores_per_socket
  cpu_hot_add_enabled    = var.cpu_hot_add_enabled
  cpu_hot_remove_enabled = var.cpu_hot_remove_enabled
  memory                 = var.memory * 1024
  memory_hot_add_enabled = var.memory_hot_add_enabled
  guest_id               = var.guest_id

  cdrom {
    datastore_id = data.vsphere_datastore.cdrom_datastore.id
    path         = var.cdrom_path
  }

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
      network_id = data.vsphere_network.network[network_interface.key].id
    }
  }
}
