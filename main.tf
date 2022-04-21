#Criando uma VPC padrão para 250 hosts
resource "aws_vpc" "Main" {
	cidr_block = var.vpc_cidr
	instance_tenancy = "default"
}

#Criando e vinculando um gateway de internet para a VPC
resource "aws_internet_gateway" "IGW" {
	vpc_id = aws_vpc.Main.id
}

