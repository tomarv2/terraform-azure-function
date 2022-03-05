output "app_service_name" {
  value = module.function.app_service_name
}

output "function_app" {
  value = module.function.azurerm_function_app
}

output "storage_account_name" {
  description = "storage account name."
  value       = module.storage_account.storage_account_name
}

output "storage_account_location" {
  description = "storage account location."
  value       = module.storage_account.storage_account_location
}

output "storage_account_primary_connection_string" {
  description = "storage account primary connection string."
  value       = module.storage_account.storage_account_primary_connection_string
}

output "storage_container_names" {
  description = "storage container name(s)."
  value       = module.storage_account.storage_container_names
}

output "asq_name" {
  description = "asq name(s)."
  value       = module.storage_account.asq_names
}

output "storage_account_access_key" {
  value       = module.storage_account.storage_account_access_key
  description = "SAS token"
}

output "blob_name" {
  value = module.storage_account.blob_name
}