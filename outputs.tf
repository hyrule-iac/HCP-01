
#############################################
# Outputs
#############################################

output "password" {
  value     = random_string.password.result
  sensitive = true
}

output "public_key" {
  value = tls_private_key.key.public_key_openssh
}

output "archivo_generado" {
  value = local_file.info.filename
}

output "environment" {
  value = var.environment
}

output "demo_token" {
  value     = module.demo.token
  sensitive = true
}

output "demo_public_key" {
  value = module.demo.public_key
}