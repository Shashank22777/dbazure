locals {
  name_prefix = "cmaz-7850b25e-mod6" # Define the prefix once for reuse

  rg_name         = format("%s-rg", local.name_prefix)     # Dynamically create resource group name
  sql_server_name = format("%s-sql", local.name_prefix)    # Dynamically create SQL Server name
  sql_db_name     = format("%s-sql-db", local.name_prefix) # Dynamically create SQL Database name
  asp_name        = format("%s-asp", local.name_prefix)    # Dynamically create App Service Plan name
  app_name        = format("%s-app", local.name_prefix)    # Dynamically create Web App name
}