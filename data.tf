data "aws_vpc" "selected" {
  vpc_id = var.vpc["cidr_block"]
}