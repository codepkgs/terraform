/*
# 如果使用的变量需要启用这一块，如果是环境变量，注释它。
# 设置环境变量
# export ALICLOUD_ACCESS_KEY="anaccesskey"
# export ALICLOUD_SECRET_KEY="asecretkey"
# export ALICLOUD_REGION="cn-beijing"
*/

# variable "access_key" {
#   type        = string
#   description = "aliyun access_key"
# }

# variable "secret_key" {
#   description = "aliyun secret_key"
#   type        = string
# }

variable "region" {
  description = "aliyun resource default region"
  type        = string
  default     = "cn-beijing"
}
