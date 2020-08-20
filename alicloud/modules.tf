module "test_beijing_vpc" {
  source = "./test/beijing/vpc"

  providers = {
    alicloud = alicloud.beijing
  }
}
