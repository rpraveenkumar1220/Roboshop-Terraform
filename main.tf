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
 source = "git::https://github.com/rpraveenkumar1220/App-Module-Terraform.git"
 env = var.env
 component = "test"
 subnet_id = element(lookup(lookup(lookup(var.vpc,"main",null ),"app",null),"cidr_block",null))))[0]
}








