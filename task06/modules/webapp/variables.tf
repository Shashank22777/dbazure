variable "region" {
  description = "Region to deploy Web Application"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name to deploy Web Application"
  type        = string
}

variable "app_service_plan" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "web_application" {
  description = "Name of the Web Application"
  type        = string
}

variable "dotnet_version" {
  description = "Dotnet version for the Web Application"
  type        = string
}

variable "sql_connection_string" {
  description = "SQL DB connection string for Web App"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to associate with resources"
  type        = map(string)
}
