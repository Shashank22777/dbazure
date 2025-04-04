resource "azurerm_service_plan" "main" {
  name                = var.app_service_plan
  resource_group_name = var.resource_group_name
  location            = var.region
  os_type             = "Linux"
  sku_name            = "P0v3"
  tags                = var.tags
}

resource "azurerm_linux_web_app" "main" {
  name                = var.web_application
  resource_group_name = var.resource_group_name
  location            = var.region
  service_plan_id     = azurerm_service_plan.main.id

  site_config {
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  connection_string {
    name  = "DatabaseConnectionString"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }

  tags = var.tags
}
