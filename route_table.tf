# Create Public Route Table
resource "aws_route_table" "prod-RT" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
}

# Associate subnet with Public Route Table
resource "aws_route_table_association" "route1" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.prod-RT.id
}
resource "aws_route_table_association" "route2" {
  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.prod-RT.id
}





# Create Private Route Table
resource "aws_route_table" "private-RT" {
  vpc_id = aws_vpc.my-vpc.id

  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_nat_gateway.natgw.id
  # }
}


# Associate subnet with Private Route Table
resource "aws_route_table_association" "route3" {
  subnet_id      = aws_subnet.private-subnet-1a.id
  route_table_id = aws_route_table.private-RT.id
}
resource "aws_route_table_association" "route4" {
  subnet_id      = aws_subnet.private-subnet-1b.id
  route_table_id = aws_route_table.private-RT.id
}
