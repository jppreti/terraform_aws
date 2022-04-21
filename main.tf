resource "aws_vpc" "Main" {
	cidr_block = var.vpc_cidr
	instance_tenancy = "default"
}

resource "aws_internet_gateway" "IGW" {
	vpc_id = aws_vpc.Main.id
}