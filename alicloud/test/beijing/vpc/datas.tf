data "alicloud_vpcs" "iamasa_vpc" {
  cidr_block = "10.0.0.0/8"
  status     = "Available"
}
