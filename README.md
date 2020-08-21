# Terraform

terraform 是一个基础设施管理工具，通过代码的形式管理基础设施，即基础设施即代码（`IaC`），并且允许通过 `provider` 支持新的基础设施。

[Terraform支持的providers](https://www.terraform.io/docs/providers/index.html)

[Terraform Module 阿里云规范](https://developer.aliyun.com/article/642624)

[Terraform Module 结构](https://www.terraform.io/docs/modules/index.html#standard-module-structure)


# 执行步骤

## 创建资源
1. 执行 `terraform init`
如果 `provider` 或 `module` 发生变化，需要执行这一步。

2. 执行 `terraform plan`
生成执行计划，检查有哪些资源发生了变化，是否是用户所期望的，如果不是，需要修改。

3. 执行 `terraform apply`
应用更改。

## 释放资源
1. 使用 `-target` 指定要释放的资源的路径，需要再三确认。  
如 `terraform destroy -target module.alicloud.module.test_hangzhou_vpc.alicloud_vpc.testVpc`