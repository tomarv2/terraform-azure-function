output "app_service_name" {
  value = module.function.app_service_name
}

output "app_id" {
  value = module.function.app_id
}

output "function_app" {
  value = module.function.azurerm_function_app
}

output "sas_url_query_string" {
  value = module.function.sas_url_query_string
}