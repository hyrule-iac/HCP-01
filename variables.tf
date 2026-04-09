#############################################
# Variables para el proyecto de pruebas
# Compatibles con HCP Terraform
#############################################

# Control general para activar/desactivar comportamientos
variable "environment" {
  type        = string
  description = "Nombre del entorno (local, dev, hcp, etc.)"
  default     = "hcp"
}

# Ejemplo de variable numérica
variable "string_length" {
  type        = number
  description = "Longitud del string aleatorio a generar"
  default     = 16
}

# Ejemplo de variable booleana
variable "include_special_chars" {
  type        = bool
  description = "Indica si el string aleatorio debe incluir caracteres especiales"
  default     = true
}

# Ejemplo de variable para plantillas o archivos
variable "owner_name" {
  type        = string
  description = "Nombre del propietario para usar en archivos o plantillas"
  default     = "Aldo"
}

# Ejemplo de variable sensible
variable "secret_note" {
  type        = string
  description = "Texto sensible para pruebas"
  default     = "valor-secreto"
  sensitive   = true
}