variable "location" {
  type        = string
  description = "Azure region where the App Service and related resources will be deployed"
}

variable "rg_name" {
  type        = string
  description = "Name of the resource group in which the App Service resources will be created"
}

variable "asp_name" {
  type        = string
  description = "Name of the Azure App Service Plan"
}

variable "app_name" {
  type        = string
  description = "Name of the Azure Linux Web Application"
}

variable "asp_sku" {
  type        = string
  description = "The SKU tier for the App Service Plan (e.g., B1, S1)"
}

variable "dotnet_version" {
  type        = string
  description = "The .NET Core version to be used by the Web Application (e.g., 6.0, 7.0)"
}

variable "sql_connection_string" {
  type        = string
  description = "Connection string to the Azure SQL Database (ADO.NET format)"
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all Azure resources"
}
