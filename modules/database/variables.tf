variable "rds_sg" {}
variable "private_subnet_1a" {}
variable "private_subnet_1b" {}
variable "rds_settings" {
  type = object({
    allocated_storage   = number
    engine              = string
    engine_version      = string
    instance_class      = string
    identifier          = string
    db_name             = string
    username            = string
    password            = string
    skip_final_snapshot = bool
  })
}