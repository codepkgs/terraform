provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_host" "host" {
  name          = var.esxi_host
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "LAN" {
  name          = "LAN"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

module "vm-18" {
  source = "../modules/vsphere/modules/virtual_machine"

  name                 = "zhanghe-vm-18"
  annotation           = "测试虚拟机"
  firmware             = "bios"
  num_cpus             = 4
  num_cores_per_socket = 4
  memory               = 8
  guest_id             = "centos7_64Guest"

  cdrom_datastore = "datastore1"
  cdrom_path      = "ISO/CentOS-7-x86_64-DVD-1810.iso"

  disks = [
    {
      label            = "disk0"
      size             = 60
      unit_number      = 0
      thin_provisioned = true
    },
    {
      label            = "disk1"
      size             = 200
      unit_number      = 1
      thin_provisioned = true
    },
    {
      label            = "disk2"
      size             = 200
      unit_number      = 2
      thin_provisioned = true
    }
  ]

  network_interfaces = ["LAN"]
}
