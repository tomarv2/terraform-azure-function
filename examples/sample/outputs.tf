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

output "app_insights_instrumentation_key" {
  description = "Application Insights Instrumentation key"
  value       = module.app_insights.instrumentation_key
}

output "app_insights_app_id" {
  description = "Application Insights Id"
  value       = module.app_insights.app_id
}

output "app_insights_connection_string" {
  description = "Application Insights connection string"
  value       = module.app_insights.connection_string
}
