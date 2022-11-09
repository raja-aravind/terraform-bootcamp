locals {
  ami_id = "ami-0de5311b2a443fb89"
  is_create = var.is_create_vpc == "True" ? 1 : 0
}