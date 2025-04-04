variable "region" {
  description = "Region to deploy SQL resources"
  type        = string
}

variable "mssql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}

variable "mssql_db_name" {
  description = "Name of the SQL Database"
  type        = string
}

variable "mssql_admin_name" {
  description = "SQL admin username"
  type        = string
}

variable "mssql_admin_name_secret" {
  description = "Key Vault Secret name for SQL admin username"
  type        = string
}

variable "mssql_admin_password_secret" {
  description = "Key Vault Secret name for SQL admin password"
  type        = string
}

variable "mssql_firewall_rule_name" {
  description = "Firewall rule name for verification"
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address allowed by the firewall rule"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for SQL Server and Database"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID to store secrets"
  type        = string
}

variable "tags" {
  description = "Tags to associate with resources"
  type        = map(string)
}