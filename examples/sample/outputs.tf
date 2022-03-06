output "app_service_name" {
  description = "Application service plan name"
  value       = module.function.app_service_name
}

output "function_app" {
  description = "Application function name"
  value       = module.function.azurerm_function_app
}

output "storage_account_name" {
  description = "storage account name"
  value       = module.storage_account.storage_account_name
}

output "storage_account_location" {
  description = "storage account location"
  value       = module.storage_account.location
}

output "storage_account_primary_connection_string" {
  description = "storage account primary connection string"
  value       = nonsensitive(module.storage_account.storage_account_primary_connection_string)
}

output "storage_container_names" {
  description = "storage container name(s)"
  value       = module.storage_container.storage_container_names
}

output "storage_account_access_key" {
  description = "Storage account access key"
  value       = nonsensitive(module.storage_account.storage_account_access_key)
}
