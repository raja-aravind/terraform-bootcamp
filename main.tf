module "Ec2-VPC" {
  
  source = "./module1"

  name_for_my_ec2 = "instance4"
  is_create_vpc = "True"
}
