variable "region" {
	description = "Define a região do provisionamento do recurso"
	default = "us-east-1"
}

variable "vpc_cidr" {
	description = "Virtual Private Cloud CIDR"
	default = "10.0.0.0/24"
}

variable "public_zone" {
	description = "Zona de disponibilidade da subrede pública"
	default = "us-east-1a"
}

variable "public_subnet" {
	description = "Segmento de rede pública"
	default = "10.0.0.128/26"
}

variable "private_zone" {
	description = "Zona de disponibilidade da subrede privada"
	default = "us-east-1b"
}

variable "private_subnet" {
	description = "Segmento de rede pública"
	default = "10.0.0.192/26"
}
