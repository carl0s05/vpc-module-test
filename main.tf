# Define una variable local que se usará como sufijo en los nombres de los recursos.
locals {
  postfix_name = "${var.environment}-${var.partial_name}"
}

# Crea una VPC en AWS con el bloque CIDR especificado en 'var.vpc_cidr_block'.
resource "aws_vpc" "module_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Define las etiquetas para la VPC, incluyendo las etiquetas 'Name' y 'Service Name' 
  tags = merge(var.tags, {
    "Name"         = "vpc-test-${local.postfix_name}"
    "Service Name" = "vpc",
  })

  # Ignora los cambias en la etiqueta 'Date/Time', dado que esta solo se considera al momento de la creación de los recursos
  lifecycle {
    ignore_changes = [tags["Date/Time"]]
  }
}

/*
# Crea un Internet Gateway en AWS y se asocia con la VPC anteriormente creada.
resource "aws_internet_gateway" "module_internet_gateway" {
  count  = var.internet_gateway_creation ? 1 : 0
  vpc_id = aws_vpc.module_vpc.id

  # Define las etiquetas para el Internet Gateway, incluyendo las etiquetas 'Name' y 'Service Name' 
  tags = merge(var.tags, {
    "Name"         = "igw-test-${local.postfix_name}",
    "Service Name" = "igw",
  })

  # Ignora los cambias en la etiqueta 'Date/Time', dado que esta solo se considera al momento de la creación de los recursos
  lifecycle {
    ignore_changes = [tags["Date/Time"]]
  }

  # Especifica una dependencia explícita con la VPC, garantizando que la VPC se cree antes que el Internet Gateway.
  depends_on = [aws_vpc.module_vpc]
}*/