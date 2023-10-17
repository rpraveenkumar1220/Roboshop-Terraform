/*
module "app"{
  source = "git::https://github.com/rpraveenkumar1220/App-Module-Terraform.git"
  for_each = var.component
  env = var.env
  component = each.key
}
*/


 module "vpc"{
  source = "git::https://github.com/rpraveenkumar1220/VPC-Module-Terraform.git"
  for_each = var.vpc
  env = var.env
  cidr_block = each.value["cidr_block"]
  subnets = each.value["subnets"]
 }

module "app_instance" {
 source    = "git::https://github.com/rpraveenkumar1220/App-Module-Terraform.git"
 env       = var.env
 component = "test"
 subnet_id = lookup(lookup(lookup(lookup(module.vpc,"main",null ),"subnet_ids",null),"app",null),"subnet_ids",null)))[0]
}








