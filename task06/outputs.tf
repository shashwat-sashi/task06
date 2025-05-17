output "sql_server_fqdn" {
  description = "Fully qualified domain name of SQL Server"
  value       = module.sql.sql_server_fqdn
}

output "app_hostname" {
  description = "Hostname of Linux Web App"
  value       = module.webapp.app_hostname
}
