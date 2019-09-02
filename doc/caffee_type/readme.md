connection.tf

provider "aws" {
  region = "${var.region}"
}

instances.tf
```
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = [
    "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = [
    "hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "newest_web_server" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  tags = {
    name = "Our favoriate server"
  }
}


```
network.tf
```
resource "aws_vpc" "new_vpc_environment" {
  cidr_block           = "${var.cidrblock}"
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet1" {
  cidr_block        = "${cidrsubnet(aws_vpc.new_vpc_environment.cidr_block, 1, 1)}"
  vpc_id            = "${aws_vpc.new_vpc_environment.id}"
  availability_zone = "${var.availability_zones["zone1"]}"
}

resource "aws_subnet" "subnet2" {
  cidr_block        = "${cidrsubnet(aws_vpc.new_vpc_environment.cidr_block, 2, 1)}"
  vpc_id            = "${aws_vpc.new_vpc_environment.id}"
  availability_zone = "${var.availability_zones["zone2"]}"
}
```

starter.sh
```
#!/usr/bin/env bash

terraform fmt

terraform plan -var-file="starter.tfvars"

echo "yes" | terraform apply -var-file="starter.tfvars"
```

starter.tfvars
```
vpc_name    = "newvpc"
environment = "env"
region      = "us-east-1"
coffee_type = "light"

```

terraform.tfvars
```
vpc_name    = "newvpc"
environment = "env"
region      = "us-east-1"

coffee_type = "dark"
```

variables.tf

```
variable "vpc_name" {
  description = "The name of the VPC network."
}

variable "environment" {}
variable "region" {}

variable "availability_zones" {
  type = "map"
  default = {
    zone1 = "us-east-1a"
    zone2 = "us-east-1b"
    zone3 = "us-east-1c"
  }
}

variable "cidrblock" {
  default = "10.0.0.0/16"
}

variable "caffee_type" {
  default     = "nothing"
  description = "Identifying what coffee level the application needs."
}
```
