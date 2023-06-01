# Output variable definitions

output "bastion_host" {
  value = aws_instance.bastion_host.public_ip
}

output "web_public_ip" {
  value = aws_instance.web-server.public_ip
}

# output "web_private_ip" {
#   value = aws_instance.web-server.private_ip
# }

output "app_public_ip" {
  value = aws_instance.application-server.public_ip
}

# output "app_private_ip" {
#   value = aws_instance.application-server.private_ip
# }




# Show DB Instance Address
output "dbEndpoint" {
  description = "The endpoint of the database"
  value       = aws_db_instance.dbinstance.address
}

output "dbPort" {
  description = "The port of the database"
  value       = aws_db_instance.dbinstance.port
}