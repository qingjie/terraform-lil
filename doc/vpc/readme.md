connections.tf
```
provider "aws" {
  region = "us-east-2"
}
```


resource.tf
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
![](img/vpc.png)
