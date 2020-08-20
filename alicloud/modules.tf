module "test_beijing_vpc" {
  source = "./test/beijing/vpc"

  providers = {
    alicloud = alicloud.beijing
  }
}

module "test_hangzhou_vpc" {
  source = "./test/hangzhou/vpc"

  providers = {
    alicloud = alicloud.hangzhou
  }
}
