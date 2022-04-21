#Criando uma VPC padrão para 250 hosts
resource "aws_vpc" "Main" {
	cidr_block = var.vpc_cidr
	instance_tenancy = "default"
}

#Criando e vinculando um gateway de internet para a VPC
resource "aws_internet_gateway" "IGW" {
	vpc_id = aws_vpc.Main.id
}

#Criando Subnet Pública
resource "aws_subnet" "PublicSubnet" {
	vpc_id = aws_vpc.Main.id
	availability_zone = var.public_zone
	cidr_block = var.public_subnet
}

#Tabela de roteamento para a subnet pública
resource "aws_route_table" "PublicRT" {
	vpc_id = aws_vpc.Main.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.IGW.id
	}
}

#Associando a tabela de roteamento pública com a subnet pública
resource "aws_route_table_association" "PublicRTassociation" {
	subnet_id = aws_subnet.PublicSubnet.id
	route_table_id = aws_route_table.PublicRT.id
}
