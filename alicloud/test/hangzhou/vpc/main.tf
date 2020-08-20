resource "alicloud_vpc" "testVpc" {
  name       = "TestVPC"
  cidr_block = "172.16.0.0/12"
}
