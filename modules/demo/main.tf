#############################################
# Módulo DEMO — compatible con HCP Terraform
#############################################

# Genera un string aleatorio
resource "random_string" "token" {
  length  = var.token_length
  special = var.use_special_chars
}

# Genera una llave privada RSA
resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Recurso nulo para demostrar triggers
resource "null_resource" "demo" {
  triggers = {
    owner          = var.owner
    token          = random_string.token.result
    key_fingerprint = tls_private_key.demo_key.public_key_fingerprint_md5
  }
}

# Archivo generado dentro del contenedor remoto
resource "local_file" "demo_file" {
  content = <<EOF
Owner: ${var.owner}
Token: ${random_string.token.result}
Fingerprint: ${tls_private_key.demo_key.public_key_fingerprint_md5}
EOF

  filename = "demo-module-output.txt"
}