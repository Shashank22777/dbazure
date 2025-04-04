provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.region

  tags = var.tags
}


data "azurerm_key_vault" "main" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}



module "sql" {
  source                    = "./modules/sql"
  region                    = var.region
  sql_server_name           = local.sql_server_name
  sql_db_name               = local.sql_db_name
  resource_group_name       = azurerm_resource_group.main.name
  key_vault_id              = data.azurerm_key_vault.main.id
  sql_admin_name            = "sql-admin-user"
  sql_admin_name_secret     = "sql-admin-name"
  sql_admin_password_secret = "sql-admin-password"
  sql_firewall_rule_name    = "allow-verification-ip"
  allowed_ip_address        = var.allowed_ip_address
  tags                      = var.tags
}

module "webapp" {
  source                = "./modules/webapp"
  region                = var.region
  resource_group_name   = azurerm_resource_group.main.name
  app_service_plan      = local.asp_name
  web_application       = local.app_name
  dotnet_version        = "8.0"
  sql_connection_string = module.sql.sql_connection_string
  tags                  = var.tags
}