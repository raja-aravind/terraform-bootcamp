resource "aws_instance" "test-server" {
  ami = local.ami_id
  instance_type = "t2.micro"

  tags = {
    "Name" = var.name_for_my_ec2
  }
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

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "test-a-b-c"
  acl    = "private"

  versioning = {
    enabled = true
  }
}


#resource "aws_<type_of_resource>" "<name>" {
#   ..configs..
#   ..key-value pair..
#}