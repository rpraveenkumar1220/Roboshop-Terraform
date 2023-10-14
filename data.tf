data "aws_vpc" "selected" {
  id = var.vpc["cidr_block"]
}