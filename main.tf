module "Ec2-VPC" {
  
  source = "./module1"

  name_for_my_ec2 = "instance4"
  is_create_vpc = "True"
}

resource "aws_instance" "public-instance5" {
  instance_type = "t2.micro"
  ami = "ami-0de5311b2a443fb89"
}