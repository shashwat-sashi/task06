output "sql_connection_string" {
  description = "SQL Connection String for ADO.NET clients"
  value       = "Server=tcp:${azurerm_mssql_server.sql.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.sql_db.name};Persist Security Info=False;User ID=${local.sql_admin_username};Password=${random_password.sql_password.result};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  sensitive   = true
}

output "sql_server_fqdn" {
  description = "SQL Server FQDN"
  value       = azurerm_mssql_server.sql.fully_qualified_domain_name
}
