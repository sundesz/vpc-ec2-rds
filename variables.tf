variable "aws_region" {
  default = "eu-north-1"
  type    = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  type    = list(string)
}

variable "azs" {
  default = ["eu-north-1a", "eu-north-1b"]
  type    = list(string)
}

variable "ec2_type" {
  default = "t3.micro"
}

variable "ec2_web_instance" {
  default = "AWS Project Backend Server"
}

# variable "key_name" {
#   default = "vockey"
# }

variable "rds_engine" {
  type    = string
  default = "mysql"
}

variable "rds_engine_version" {
  type    = string
  default = "8.0"
}

variable "rds_instance_class" {
  type    = string
  default = "db.t3.micro"
}


variable "rds_identifier" {
  type    = string
  default = "dbinstance"
}


variable "rds_db_name" {
  type    = string
  default = "employees"
}


variable "rds_username" {
  type    = string
  default = "ec2-user"
  sensitive = true
}

variable "rds_password" {
  type    = string
  default = "admin"
  sensitive = true
}

# This variable contains the configuration settings for the EC and RDS instances
variable "settings" {
  description = "Configuration settings"
  type        = map(any)
  default = {
    "database" = {
      engine              = "mysql"
      engine_version      = "8.0.27"
      instance_class      = "db.t2.micro"
      db_name             = ""
      skip_final_snapshot = true
    },
    "web_app" = {
      instance_type = "t2.micro"
    }

  }

}