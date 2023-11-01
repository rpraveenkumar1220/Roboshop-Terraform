/*
module "app"{
  source = "git::https://github.com/rpraveenkumar1220/App-Module-Terraform.git"
  for_each = var.component
  env = var.env
  component = each.key
}
*/


### Creating VPC for Roboshop project
 module "vpc"{
  source = "git::https://github.com/rpraveenkumar1220/VPC-Module-Terraform.git"
  for_each = var.vpc
  env = var.env
  cidr_block = each.value["cidr_block"]
  subnets = each.value["subnets"]
  default_vpc_id = var.default_vpc_id
 }

### Creating Instance in the APP subnet
module "app_instance" {
 source    = "git::https://github.com/rpraveenkumar1220/App-Module-Terraform.git"
 env       = var.env
 component = "test"
 subnet_id = lookup(lookup(lookup(lookup(module.vpc,"main",null ),"subnet_ids",null),"app",null),"subnet_ids",null)[0]
 vpc_id =lookup(lookup(module.vpc,"main",null), "vpc_id" , null)
}


### Creating Rabbitmq service
module "rabbitmq" {
 source        = "git::https://github.com/rpraveenkumar1220/RabbitMQ-Module-Terraform.git"
 for_each      = var.rabbitmq
 component     = each.value["component"]
 instance_type = each.value["instance_type"]
 subnet_id     = lookup(lookup(lookup(lookup(module.vpc, "main", null ), "subnet_ids", null), "db", null), "subnet_ids", null)[0]
 sg_subnet_cidr = lookup(lookup(lookup(lookup(module.vpc,"main",null ),"subnet_ids",null),"app",null),"cidr_block",null)
 vpc_id        = lookup(lookup(module.vpc, "main", null), "vpc_id", null)

 env            = var.env
 allow_ssh_cidr = var.allow_ssh_cidr
}









