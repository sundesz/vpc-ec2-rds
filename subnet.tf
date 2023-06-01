resource "aws_subnet" "public-subnet-1a" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.subnet_cidr[0]
  availability_zone       = var.availability_zone[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-1a"
  }
}

resource "aws_subnet" "public-subnet-1b" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = element(var.subnet_cidr, 1)
  availability_zone       = var.availability_zone[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-1b"
  }
}

resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = element(var.subnet_cidr, 2)
  availability_zone = var.availability_zone[0]

  tags = {
    Name = "private-1a"
  }
}

resource "aws_subnet" "private-subnet-1b" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = element(var.subnet_cidr, 3)
  availability_zone = var.availability_zone[1]

  tags = {
    Name = "private-1b"
  }
}