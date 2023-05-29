## LAB 160

# Relational Database Service Subnet Group
resource "aws_db_subnet_group" "dbsubnet" {
  name       = "dbsubnet"
  subnet_ids = [aws_subnet.private-subnet-1a.id, aws_subnet.private-subnet-1b.id]
}

# Create RDS Instance
resource "aws_db_instance" "dbinstance" {
  allocated_storage      = 5
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  identifier             = "dbinstance"
  db_name                = "employees"
  username               = var.rds_username
  password               = var.rds_password
  db_subnet_group_name   = aws_db_subnet_group.dbsubnet.id
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
}