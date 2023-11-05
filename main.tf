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
  default_vpc_rt = var.default_vpc_rt
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
 kms_key_id  = var.kms_key_id
 env            = var.env
 allow_ssh_cidr = var.allow_ssh_cidr
}



/*
### Creating RDS service
module "rds" {
 source        = "git::https://github.com/rpraveenkumar1220/RDS-Module-Terraform.git"
 for_each      = var.rds
 component     = each.value["component"]
 engine        = each.value["engine"]
 engine_version=each.value["engine_version"]
 database_name = each.value["database_name"]
 instance_class = each.value["instance_class"]
 instance_count = each.value["instance_count"]
 kms_key_arn   = var.kms_key_arn
 subnet_ids    = lookup(lookup(lookup(lookup(module.vpc, "main", null ), "subnet_ids", null), "db", null), "subnet_ids", null)[0]
 sg_subnet_cidr = lookup(lookup(lookup(lookup(module.vpc,"main",null ),"subnet_ids",null),"app",null),"cidr_block",null)
 vpc_id        = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
 env            = var.env
}

### Creating DOCDB service
module "docdb" {
 source        = "git::https://github.com/rpraveenkumar1220/DocDB-Module-Terraform.git"
 for_each      = var.docdb
 component     = each.value["component"]
 engine        = each.value["engine"]
 engine_version=each.value["engine_version"]
 instance_class = each.value["instance_class"]
 instance_count = each.value["instance_count"]
 kms_key_arn   = var.kms_key_arn
 subnet_ids    = lookup(lookup(lookup(lookup(module.vpc, "main", null ), "subnet_ids", null), "db", null), "subnet_ids", null)[0]
 sg_subnet_cidr = lookup(lookup(lookup(lookup(module.vpc,"main",null ),"subnet_ids",null),"app",null),"cidr_block",null)
 vpc_id        = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
 env            = var.env
}

### Creating Elasticache service
module "elasticache" {
 source        = "git::https://github.com/rpraveenkumar1220/ElasticCache-Module-Terraform.git"
 for_each      = var.elasticache
 component     = each.value["component"]
 engine        = each.value["engine"]
 engine_version=each.value["engine_version"]
 node_type     = each.value["node_type"]
 parameter_group_name = each.value["parameter_group_name"]
 instance_count = each.value["instance_count"]
 num_node_groups=each.value["num_node_groups"]
 replicas_per_node_group=each.value["replicas_per_node_group"]
 kms_key_arn   = var.kms_key_arn
 subnet_ids    = lookup(lookup(lookup(lookup(module.vpc, "main", null ), "subnet_ids", null), "db", null), "subnet_ids", null)[0]
 sg_subnet_cidr = lookup(lookup(lookup(lookup(module.vpc,"main",null ),"subnet_ids",null),"app",null),"cidr_block",null)
 vpc_id        = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
 env            = var.env
}
*/












