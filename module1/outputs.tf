
output "instance_id_of_test_server" {
  value = aws_instance.test-server.id
} 

output "private_ip_addres_of_test_server" {
  value = aws_instance.test-server.private_ip
} 
