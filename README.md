# terraform-lil
Leaning course work



* [create vpc](/doc/readme.md)

```
provider "aws" {
  region = "us-east-1"
}
```
```
resource "aws_vpc" "environment-example-two" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "terraform-aws-vpc-example-two"
  }
}
```
