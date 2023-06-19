terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "default"
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "networking" {
  source             = "./modules/networking"
  vpc_id             = module.vpc.vpc_id
  public_cidrs       = var.public_cidrs
  private_cidrs      = var.private_cidrs
  availability_zones = var.availability_zones
}

module "database" {
  source            = "./modules/database"
  private_subnet_1a = module.networking.private_subnet_1a
  private_subnet_1b = module.networking.private_subnet_1b
  rds_sg            = module.networking.rds_sg
  rds_settings      = var.settings.database_instance
}

module "compute" {
  source            = "./modules/compute"
  db_instance       = module.database.db_instance
  dbEndpoint        = module.database.dbEndpoint
  public_subnet_1a  = module.networking.public_subnet_1a
  private_subnet_1a = module.networking.private_subnet_1a
  bastion_sg        = module.networking.bastion_sg
  web_sg            = module.networking.web_sg
  app_sg            = module.networking.app_sg
  settings          = var.settings
}
