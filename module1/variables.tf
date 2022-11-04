variable "name_for_my_ec2" {
  description = "Name for the ec2 instance"
  default = "instance3"
  type = string
}

variable "is_create_vpc" {
  description = "Determine whether the VPC has to be created or not"
  default = "True"
  type = string
}