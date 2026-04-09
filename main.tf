#############################################
#  Proyecto de prueba para HCP Terraform
#  Usando variables y providers seguros
#############################################

# Genera un string aleatorio usando variables
resource "random_string" "password" {
  length  = var.string_length
  special = var.include_special_chars
}

# Genera una llave privada RSA
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Espera un tiempo para ver el run en acción
resource "time_sleep" "wait" {
  create_duration = "5s"
}

# Recurso nulo que depende de los anteriores
resource "null_resource" "demo" {
  triggers = {
    password        = random_string.password.result
    key_fingerprint = tls_private_key.key.public_key_fingerprint_md5
    environment     = var.environment
  }

  depends_on = [
    time_sleep.wait
  ]
}

# Crea un archivo dentro del contenedor remoto de HCP Terraform
resource "local_file" "info" {
  content = <<EOF
Owner: ${var.owner_name}
Environment: ${var.environment}

Password generada:
${random_string.password.result}

Fingerprint:
${tls_private_key.key.public_key_fingerprint_md5}

Nota secreta:
${var.secret_note}
EOF

  filename = "info.txt"
}

module "demo" {
  source = "./modules/demo"

  owner             = var.owner_name
  token_length      = var.string_length
  use_special_chars = var.include_special_chars
}
