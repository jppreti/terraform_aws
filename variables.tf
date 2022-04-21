variable "region" {
	description = "Define a região do provisionamento do recurso"
	default = "us-east-1"
}

variable "vpc_cidr" {
	description = "Virtual Private Cloud CIDR"
	default = "10.0.0.0/24"
}