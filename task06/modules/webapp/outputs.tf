output "app_hostname" {
  description = "Hostname of the Linux Web App"
  value       = azurerm_linux_web_app.webapp.default_hostname
}
