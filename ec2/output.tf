output "security_group" {
  value = "aws_security_group.sg-web.id"
}

output "instance_id" {
  value = "aws_instance.my-server.public_ip"
}