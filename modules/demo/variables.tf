#############################################
# Variables del módulo DEMO
#############################################

variable "owner" {
  type        = string
  description = "Nombre del propietario o etiqueta para el módulo."
}

variable "token_length" {
  type        = number
  description = "Longitud del token aleatorio."
  default     = 12
}

variable "use_special_chars" {
  type        = bool
  description = "Indica si el token debe incluir caracteres especiales."
  default     = true
}