output "testVpc_id" {
  value = alicloud_vpc.testVpc.id
}

output "iamasaVpc_id" {
  value = data.alicloud_vpcs.iamasa_vpc.vpcs.0.id
}
