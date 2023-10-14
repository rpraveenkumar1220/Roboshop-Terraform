data "aws_vpc" "selected" {
  filter {
    name  = "tag:Name"
    values = "${var.env}-vpc"
    state = "pending"
  }
}