aws_region = "us-west-2"
azs        = ["us-west-2a", "us-west-2b"]

vpc_cidr    = "192.168.0.0/16"
subnet_cidr = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24"]

rds_engine         = "mysql"
rds_engine_version = "8.0"
rds_instance_class = "db.t3.micro"
rds_identifier     = "lab-db"
rds_db_name        = "employees"
rds_username       = "main"
rds_password       = "lab-password"