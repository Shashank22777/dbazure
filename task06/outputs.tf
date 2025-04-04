output "sql_server_fqdn" {
  description = "Fully qualified domain name of the SQL server"
  value       = module.sql.sql_server_fqdn
}

output "app_hostname" {
  description = "Hostname of the Web App"
  value       = module.webapp.app_hostname
}