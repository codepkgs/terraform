provider "alicloud" {
  # access_key = var.access_key
  # secret_key = var.secret_key
  region = var.region
}

provider "alicloud" {
  # access_key = var.access_key
  # secret_key = var.secret_key
  region = "cn-beijing"
  alias  = "beijing"
}

provider "alicloud" {
  # access_key = var.access_keys
  # secret_key = var.secret_key
  region = "cn-hangzhou"
  alias  = "hangzhou"
}
