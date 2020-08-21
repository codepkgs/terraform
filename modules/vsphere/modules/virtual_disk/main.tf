resource "vsphere_virtual_disk" "vdisk" {
  size       = var.vmdk_size
  vmdk_path  = var.vmdk_name
  datacenter = var.datacenter
  datastore  = var.datastore
  type       = var.vmdk_type
}
