# VPC
resource "aws_vpc" "main" {
    cidr_block              = var.vpc_cidr
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
        Name              = "${var.env}-VPC"
    }
}

# ======================Public======================== #

# Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "${var.env}-INTERNET-GATEWAY"
    }
}

# Route Table Public
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "${var.env}-PUBLIC-ROUTE-TABLE"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}


# Public subnet
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.subnet_public_cidr
    tags = {
        Name = "${var.env}-PUBLIC-SUBNET"
    }
}

# Public aws_route_table_association
resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

# ======================Private======================== #

# Private subnet
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.subnet_private_cidr
    tags = {
        Name = "${var.env}-PRIVATE-SUBNET"
    }
}

# Private Route Table
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "${var.env}-PRIVATE-ROUTE-TABLE"
    }
}

# Private
resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
}
