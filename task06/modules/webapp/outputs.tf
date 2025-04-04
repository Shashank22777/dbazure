output "app_hostname" {
  description = "The hostname of the Web Application"
  value       = azurerm_linux_web_app.main.default_hostname
}