# 证书domain
output "certificate_domain" {
  value = acme_certificate.certificate.certificate_domain
}

# 服务器私钥
output "private_key_pem" {
  value = acme_certificate.certificate.private_key_pem
}

# 服务器证书
output "certificate_pem" {
  value = acme_certificate.certificate.certificate_pem
}

# 间接证书
output "issuer_pem" {
  value = acme_certificate.certificate.issuer_pem
}
