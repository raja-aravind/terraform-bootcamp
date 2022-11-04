provider "aws" {
  region = "ap-northeast-1"
  shared_credentials_files = [ "/Users/akannan7/.aws/credentials" ]
  profile = "aws_bootcamp1"
}

locals {
  ami_id = "ami-0de5311b2a443fb89"
  is_create = var.is_create_vpc == "True" ? 1 : 0
}

resource "aws_instance" "test-server" {
  ami = local.ami_id
  instance_type = "t2.micro"

  tags = {
    "Name" = var.name_for_my_ec2
  }
}

variable "name_for_my_ec2" {
  description = "Name for the ec2 instance"
  type = string
}

variable "is_create_vpc" {
  description = "Determine whether the VPC has to be created or not"
  type = string
}

output "instance_id_of_test_server" {
  description = "This is the instance id of my test server"
  value = aws_instance.test-server.id
} 

output "private_ip_addres_of_test_server" {
  value = aws_instance.test-server.private_ip
} 

resource "aws_vpc" "list-of-vpcs" {
  for_each = toset(["11.0.0.0/16", "12.0.0.0/16"])
  cidr_block = each.key
}

resource "aws_vpc" "vpc4" {

  count = local.is_create

  cidr_block = "14.0.0.0/16"

  tags = {
    "Name" = "vpc4"
  }
}




#resource "aws_<type_of_resource>" "<name>" {
#   ..configs..
#   ..key-value pair..
#}