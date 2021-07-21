output "web-server-ip" {
  description = "The IP of webserver"
  value       = module.web-server.private_ip
}

output "app-server-ip" {
  description = "The IP of webserver"
  value       = module.app-server.private_ip
}
output "db-server-ip" {
  description = "The IP of webserver"
  value       = module.db-server.private_ip
}
