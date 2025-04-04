variable "key_vault_name" {
  description = "The name of the existing Key Vault"
  type        = string
}

variable "key_vault_rg_name" {
  description = "Resource group name for the existing Key Vault"
  type        = string
}

variable "region" {
  description = "Region to deploy resources"
  type        = string
}

variable "allowed_ip_address" {
  description = "IP Address for firewall rules"
  type        = string
}

variable "tags" {
  description = "Tags to associate with resources"
  type        = map(string)
}