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

#Criando Subnet Privada
resource "aws_subnet" "PrivateSubnet" {
	vpc_id = aws_vpc.Main.id
	availability_zone = var.private_zone
	cidr_block = var.private_subnet
}

#Criando um Elastic IP para gerenciamento de IPs
resource "aws_eip" "EIP" {
	vpc = true
}

#Criando um NAT Gateway para permitir o acesso a recursos externos
resource "aws_nat_gateway" "NATgw" {
	allocation_id = aws_eip.EIP.id
	subnet_id = aws_subnet.PublicSubnet.id
}

#Tabela de roteamento para a subnet privada
resource "aws_route_table" "PrivateRT" {
	vpc_id = aws_vpc.Main.id
	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.NATgw.id
	}
}

#Associando a tabela de roteamento com a subrede privada
resource "aws_route_table_association" "PrivateRTassociation" {
	subnet_id = aws_subnet.PrivateSubnet.id
	route_table_id = aws_route_table.PrivateRT.id
}
