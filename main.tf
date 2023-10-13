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
  subnets=each.value["subnets"]
}



module "subnet"{
  source = "git::https://github.com/rpraveenkumar1220/Subnets-Module-Terraform.git"
  for_each = var.subnets
  cidr_block = each.value["cidr_block"]
  vpc_id = data.aws_vpc.selected.id
  }



