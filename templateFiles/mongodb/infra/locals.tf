locals {
  availability_zone = "eu-west-3a"
  block_cidr = cidrsubnet("10.0.0.0/16", 8, var.vpc_block)
}
