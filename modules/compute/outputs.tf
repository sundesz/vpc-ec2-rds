output "bastion_host_public_ip" {
  value = aws_instance.bastion_host.public_ip
}

output "web_server_public_dns" {
  value = aws_instance.web_server.public_dns
}

output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "web_server_private_ip" {
  value = aws_instance.web_server.private_ip
}

output "application_server_public_ip" {
  value = aws_instance.application_server.public_ip
}

output "application_server_private_ip" {
  value = aws_instance.application_server.private_ip
}