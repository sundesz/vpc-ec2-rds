# Output variable definitions

output "bastion_host" {
  value = module.compute.bastion_host_public_ip
}
output "web_server_public_dns" {
  value = module.compute.web_server_public_dns
}
output "web_server_public_ip" {
  value = module.compute.web_server_public_ip
}

output "web_server_private_ip" {
  value = module.compute.web_server_private_ip
}

output "app_server_public_ip" {
  value = module.compute.application_server_public_ip
}

output "app_server_private_ip" {
  value = module.compute.application_server_private_ip
}

# Show DB Instance Address
output "dbEndpoint" {
  description = "The endpoint of the database"
  value       = module.database.dbEndpoint
}

output "dbPort" {
  description = "The port of the database"
  value       = module.database.dbPort
}