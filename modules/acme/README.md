# 支持的 dns provider

[dns_provider](https://www.terraform.io/docs/providers/acme/dns_providers/index.html)

# 使用

```text
module "acme_alidns" {
  source = "../modules/acme"

  # staging 环境（如果没有指定server_url，默认是staging）
  # server_url    = "https://acme-staging-v02.api.letsencrypt.org/directory"

  # production
  # server_url    = "https://acme-v02.api.letsencrypt.org/directory"
  email_address = "YOUR EMAIL_ADDRESS"
  dns_provider  = "alidns"
  common_name   = "fdisk.cc"
  san           = ["*.fdisk.cc"]
}
```

# 将输出的内容保存到文件

```bash
# 证书输出路径
cert_path="."

# 输出私钥
terraform output private_key_pem > $cert_path/$(terraform output certificate_domain).key

# 输出服务器证书
terraform output certificate_pem > $cert_path/$(terraform output certificate_domain).crt

# 输出CA证书
terraform output issuer_pem > $cert_path/$(terraform output certificate_domain).crt

# 输出证书链(包含服务器证书和CA证书)
terraform output certificate_pem > $cert_path/$(terraform output certificate_domain).crt
terraform output issuer_pem >> $cert_path/$(terraform output certificate_domain).crt
```
