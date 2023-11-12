locals {

  public_web_subnets_cidr = concat(lookup(lookup(lookup(lookup(var.vpc, "main", null ), "subnets", null), "public", null), "cidr_block", null), lookup(lookup(lookup(lookup(var.vpc, "main", null ), "subnet_ids", null), "web", null), "cidr_block", null))

  web_app_subnets_cidr = concat(lookup(lookup(lookup(lookup(var.vpc, "main", null ), "subnets", null), "web", null), "cidr_block", null), lookup(lookup(lookup(lookup(var.vpc, "main", null ), "subnet_ids", null), "app", null), "cidr_block", null))


}