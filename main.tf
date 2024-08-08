module "vpc" {
  source  = "./vpc"
  vpc_name = var.vpc_name
  project = var.project   
}

module "subnet" {
  source       = "./subnet"
  vpc_id       = module.vpc.vpc_id
  region       = var.region
  subnet_configs = var.subnet_configs
  project = var.project
}

module "nat_gateway" {
  source       = "./nat_gateway"
  vpc_id       = module.vpc.vpc_id
  region       = var.region
  router_name  = var.router_name
  nat_name     = var.nat_name
  project = var.project
}
module "firewalls" {
  source        = "./firewalls"
  vpc_id        = module.vpc.vpc_id
  firewalls     = var.firewalls
  project = var.project
}