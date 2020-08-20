# Terraform

terraform 是一个基础设施管理工具，通过代码的形式管理基础设施，即基础设施即代码（`IaC`），并且允许通过 `provider` 支持新的基础设施。

[Terraform支持的providers](https://www.terraform.io/docs/providers/index.html)

# Terraform 目录结构

个人目前使用的目录结构为：`MODULE/ENVIRONMENT/REGION/RESOURCE/*.tf`
输出变量统一放在 `outputs.tf`，定义的变量统一放在 `variables.tf`，入口文件统一为 `main.tf`

## 目录结构说明

结构说明:  
MODULE：模块，如alicloud、vsphere  
ENVIRONMENT：环境，如prod、dev、test等。  
REGION：云平台所对应的REGION，如果没有，则可以省略。如cn-beijing, cn-hangzhou等  
RESOURCE：具体的资源，如ecs、vpc、slb等。  
RESOURCE_NAME：采用驼峰命名。如 testVpc  


## module 定义规范
这里主要针对的是子模块的定义规范。
* 子模块定义时，采用 `ENVIRONMENT_REGION_RESOURCE` 的格式进行定义，采用驼峰法。如 `test_beijing_vpc`，表示引用的资源是 `test/beijing/vpc`


## `output` 输出变量时的规范
* 子模块只暴露当前资源的属性，资源和属性之间使用下划线（`_`）隔开，如 `testVpc_id`
* 上层如果也要暴露内层资源的属性，要加上相应的目录结构，也采用下划线隔开。如 `test_beijing_vpc_testVpc_id`
* 根目录暴露变量的时候，加上资源所在的模块。如 `alicloud_test_beijing_vpc_testVpc_id`


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