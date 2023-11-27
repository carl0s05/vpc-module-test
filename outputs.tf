output "vpc_id" {
  description = "Identificador de la VPC generada"
  value       = aws_vpc.module_vpc.id
}

output "default_route_table_id" {
  description = "Identificador de la tabla de ruteo principal de la VPC generada"
  value       = aws_vpc.module_vpc.default_route_table_id
}

output "internet_gateway_id" {
  description = "Identificador del Internet Gateway asociado a la VPC"
  value       = var.internet_gateway_creation ? aws_internet_gateway.module_internet_gateway[0].id : ""
}