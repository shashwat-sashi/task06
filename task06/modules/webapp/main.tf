resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = "Linux"
  sku_name            = var.asp_sku
  tags                = var.tags
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = true
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }

  connection_string {
    name  = "SqlConnectionString"
    type  = "SQLAzure"
    value = var.sql_connection_string

  }

  tags = var.tags
}
