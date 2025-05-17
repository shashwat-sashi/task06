variable "location" {
  description = "Azure Region"
  type        = string
}

variable "kv_rg_name" {
  description = "Resource Group name of existing Key Vault"
  type        = string
}

variable "kv_name" {
  description = "Name of existing Key Vault"
  type        = string
}

variable "resources_name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "sql_admin_secret_name" {
  description = "Key Vault secret name for SQL admin username"
  type        = string
}

variable "sql_admin_secret_password" {
  description = "Key Vault secret name for SQL admin password"
  type        = string
}

variable "sql_sku" {
  description = "Azure SQL Database SKU"
  type        = string
}

variable "sql_fwr_name" {
  description = "SQL Server Firewall Rule name"
  type        = string
}

variable "asp_sku" {
  description = "App Service Plan SKU"
  type        = string
}

variable "app_dotnet_version" {
  description = "Web Application .NET version"
  type        = string
}

variable "student_email" {
  description = "Student email for tagging"
  type        = string
}

variable "allowed_ip_address" {
  description = "IP address allowed to access SQL Server"
  type        = string
}
