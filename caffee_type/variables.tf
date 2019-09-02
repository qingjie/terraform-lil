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