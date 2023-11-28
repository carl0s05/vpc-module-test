variable "vpc_cidr_block" {
  description = "Bloque CIDR que se utilizará para crear la VPC"
  type        = string
}
/*
variable "internet_gateway_creation" {
  description = "Indica si un Internat Gateway debe ser creado en la VPC"
  type        = bool
}
*/
variable "partial_name" {
  description = "Variable utilizada para el nombrado estándar de los recursos"
  type        = string
}

variable "environment" {
  description = "Variable utilizada para el nombrado estándar de los recursos"
  type        = string
}

variable "tags" {
  description = "Etiquetas base para el recurso"
  type        = map(string)
}