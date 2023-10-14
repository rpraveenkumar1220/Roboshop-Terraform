data "aws_vpc" "selected" {
  cidr_block = var.vpc["cidr_block"]
}