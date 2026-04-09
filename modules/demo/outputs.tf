#############################################
# Outputs del módulo DEMO
#############################################

output "token" {
  value     = random_string.token.result
  sensitive = true
  description = "Token generado por el módulo."
}

output "public_key" {
  value       = tls_private_key.demo_key.public_key_openssh
  description = "Llave pública generada por el módulo."
}

output "fingerprint" {
  value       = tls_private_key.demo_key.public_key_fingerprint_md5
  description = "Fingerprint de la llave pública."
}

output "generated_file" {
  value       = local_file.demo_file.filename
  description = "Archivo generado dentro del contenedor remoto."
}