# # vsphere
# provider "vsphere" {
#   user                 = var.vsphere_user
#   password             = var.vsphere_password
#   vsphere_server       = var.vsphere_server
#   allow_unverified_ssl = true
# }

# data "vsphere_datacenter" "datacenter" {
#   name = var.datacenter
# }

# data "vsphere_host" "host" {
#   name          = var.esxi_host
#   datacenter_id = data.vsphere_datacenter.datacenter.id
# }

# # cobbler
# provider "cobbler" {
#   username = var.cobbler_username
#   password = var.cobbler_password
#   url      = var.cobbler_url
# }

# aliyun
provider "alicloud" {
  # access_key = var.access_key
  # secret_key = var.secret_key
  region = var.region
}
