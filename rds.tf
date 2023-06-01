## LAB 160

# Relational Database Service Subnet Group
resource "aws_db_subnet_group" "dbsubnet" {
  name       = "dbsubnet"
  subnet_ids = [aws_subnet.private-subnet-1a.id, aws_subnet.private-subnet-1b.id]
}

# Create RDS Instance
resource "aws_db_instance" "dbinstance" {
  allocated_storage      = var.settings.database_instance.allocated_storage
  engine                 = var.settings.database_instance.engine
  engine_version         = var.settings.database_instance.engine_version
  instance_class         = var.settings.database_instance.instance_class
  identifier             = var.settings.database_instance.identifier
  db_name                = var.settings.database_instance.db_name
  username               = var.settings.database_instance.username
  password               = var.settings.database_instance.password
  db_subnet_group_name   = aws_db_subnet_group.dbsubnet.id
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = var.settings.database_instance.skip_final_snapshot
}