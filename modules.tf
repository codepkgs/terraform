module "alicloud" {
  source = "./alicloud"

  # 模块需要的变量，也可以采用环境变量的方式
  # access_key     = "YOUR ACCESS KEY"
  # secret_key     = "YOUR SECRET KEY"
  region = "cn-beijing"
}
