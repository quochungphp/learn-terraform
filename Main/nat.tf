# Nat gateway
# Allow all of components stay in instance can update and go through internet by private ip
# Such as : database, nginx can update
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.main-public-1.id
  depends_on    = [aws_internet_gateway.main-gw]
}

# VPC setup for NAT
resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  // Redirect or send all traffic from VPC to nat gw
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "main-private-1"
  }
}

# Route associations private
# Single associate route table id created by single private subnet
# Every single private subnet need to define a associate route table id
# Note: If you want not VPC go out internet, you can wrap this block in comment
resource "aws_route_table_association" "main-private-1-a" {
  subnet_id      = aws_subnet.main-private-1.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-2-a" {
  subnet_id      = aws_subnet.main-private-2.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-3-a" {
  subnet_id      = aws_subnet.main-private-3.id
  route_table_id = aws_route_table.main-private.id
}
