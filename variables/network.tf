resource "aws_vpc" "environment-example-two" {
  cidr_block           = "${var.aws_ip_cidr_range}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform-aws-vpc-example-two"
  }
}
