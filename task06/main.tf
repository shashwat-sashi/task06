resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = local.tags
}


module "sql" {
  source                    = "./modules/sql"
  location                  = azurerm_resource_group.main.location
  rg_name                   = azurerm_resource_group.main.name
  sql_server_name           = local.sql_server_name
  sql_db_name               = local.sql_db_name
  sql_sku                   = var.sql_sku
  sql_fwr_name              = var.sql_fwr_name
  kv_name                   = var.kv_name
  kv_rg_name                = var.kv_rg_name
  sql_admin_secret_name     = var.sql_admin_secret_name
  sql_admin_secret_password = var.sql_admin_secret_password
  allowed_ip_address        = var.allowed_ip_address
  tags                      = local.tags
}

module "webapp" {
  source                = "./modules/webapp"
  location              = var.location
  rg_name               = azurerm_resource_group.main.name
  asp_name              = local.asp_name
  app_name              = local.app_name
  asp_sku               = var.asp_sku
  dotnet_version        = var.app_dotnet_version
  tags                  = local.tags
  sql_connection_string = module.sql.sql_connection_string
}
