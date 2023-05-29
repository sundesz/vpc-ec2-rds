# Output variable definitions

# output "arn" {
#   description = "ARN of the server"
#   value       = aws_instance.web-server.arn
# }

output "web_public_ip" {
  value = aws_instance.web-server.public_ip
}

output "web_private_ip" {
  value = aws_instance.web-server.private_ip
}

output "app_public_ip" {
  value = aws_instance.application-server.public_ip
}

output "app_private_ip" {
  value = aws_instance.application-server.private_ip
}





# # This will output the public IP of the web server
# output "web_public_ip" {
#   description = "Public IP of the web server"
#   value       = aws_eip.eip.public_ip
#   # This output waits for the EIPs to be created and distributed
#   depends_on = [aws_eip.eip]
# }

# # This will output the public DNS address of the web server
# output "web_public_dns" {
#   description = "Public DNS of the web server"
#   value       = aws_eip.eip.public_dns

#   # This output waits for the EIPs to be created and distributed
#   depends_on = [aws_eip.eip]
# }


# Show DB Instance Address
output "dbEndpoint" {
  description = "The endpoint of the database"
  value = aws_db_instance.dbinstance.address
}

output "dbPort" {
  description = "The port of the database"
  value = aws_db_instance.dbinstance.port
}