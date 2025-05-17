variable "location" {
  type        = string
  description = "Azure region where resources will be deployed"
}

variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "sql_server_name" {
  type        = string
  description = "Name of the Azure SQL Server instance"
}

variable "sql_db_name" {
  type        = string
  description = "Name of the SQL Database"
}

variable "sql_sku" {
  type        = string
  description = "The SKU for the SQL database (e.g., Basic, S0)"
}

variable "sql_fwr_name" {
  type        = string
  description = "Name for the SQL Server firewall rule"
}

variable "sql_admin_secret_name" {
  type        = string
  description = "Name of the Key Vault secret to store SQL admin username"
}

variable "sql_admin_secret_password" {
  type        = string
  description = "Name of the Key Vault secret to store SQL admin password"
}

variable "allowed_ip_address" {
  type        = string
  description = "IP address allowed to access the SQL Server"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
}

variable "kv_rg_name" {
  description = "Resource Group name of existing Key Vault"
  type        = string
}

variable "kv_name" {
  description = "Name of existing Key Vault"
  type        = string
}