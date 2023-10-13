data "aws_vpc" "selected" {
  for_each = var.vpc
  cidr_block = each.value["cidr_block"]
}