data "aws_vpc" "selected" {
  cidr_block = module.vpc[cidr_block]
}