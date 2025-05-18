resource "random_password" "sql_password" {
  length  = 16
  special = true
}

resource "azurerm_mssql_server" "sql" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = random_password.sql_password.result
  tags                         = var.tags
}

resource "azurerm_mssql_firewall_rule" "azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "allow_my_ip" {
  name             = var.sql_fwr_name
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_mssql_database" "sql_db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql.id
  sku_name  = var.sql_sku
  tags      = var.tags
}

resource "azurerm_key_vault_secret" "admin_username" {
  name         = var.sql_admin_secret_name
  value        = var.sql_admin_username
  key_vault_id = data.azurerm_key_vault.existing.id
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = var.sql_admin_secret_password
  value        = random_password.sql_password.result
  key_vault_id = data.azurerm_key_vault.existing.id
  depends_on   = [random_password.sql_password]
}

data "azurerm_key_vault" "existing" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}