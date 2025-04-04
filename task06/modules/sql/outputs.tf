output "sql_connection_string" {
  description = "The connection string for connecting to the SQL Database"
  sensitive   = true
  value       = format(
    "Server=tcp:%s;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_sql_server.main.fully_qualified_domain_name,   # SQL Server FQDN
    azurerm_sql_database.main.name,                       # SQL DB Name
    var.sql_admin_name,                                   # Admin Username
    random_password.sql_admin_password.result             # Generated Password
  )
}

output "sql_server_fqdn" {
  description = "The Fully Qualified Domain Name of the SQL Server"
  value       = azurerm_sql_server.main.fully_qualified_domain_name
}