# Create Public Route Table
resource "aws_route_table" "public_RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Associate subnet with Public Route Table
resource "aws_route_table_association" "public_route1" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_RT.id
}
resource "aws_route_table_association" "public_route2" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_RT.id
}





# Create Private Route Table
resource "aws_route_table" "private_RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "private-rt"
  }
}


# Associate subnet with Private Route Table
resource "aws_route_table_association" "private_route1" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_RT.id
}
resource "aws_route_table_association" "private_route2" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private_RT.id
}
