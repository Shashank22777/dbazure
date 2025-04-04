# Random Password: Generate admin password
resource "random_password" "sql_admin_password" {
  length  = 16
  special = true
}

# SQL Server: Define the Azure SQL Server
resource "azurerm_mssql_server" "main" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.region
  administrator_login          = var.sql_admin_name
  administrator_login_password = random_password.sql_admin_password.result
  version                      = "12.0"

  tags = var.tags
}

# SQL Database: Create a database within the SQL Server
resource "azurerm_mssql_database" "main" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.main.id
  sku_name  = "S2"
  tags      = var.tags
}

# SQL Firewall Rule: Allow connections from Azure services
resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# SQL Firewall Rule: Allow connections from a verification IP
resource "azurerm_mssql_firewall_rule" "allow_verification_ip" {
  name             = var.sql_firewall_rule_name
  server_id        = azurerm_mssql_server.main.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

# Store SQL Admin Name in Key Vault Secret
resource "azurerm_key_vault_secret" "sql_admin_name" {
  name         = var.sql_admin_name_secret
  value        = var.sql_admin_name
  key_vault_id = var.key_vault_id
}

# Store SQL Admin Password in Key Vault Secret
resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.sql_admin_password_secret
  value        = random_password.sql_admin_password.result
  key_vault_id = var.key_vault_id
}
