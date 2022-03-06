output "app_service_name" {
  description = "Application service plan name"
  value       = join("", azurerm_app_service_plan.service_plan.*.name)
}

output "azurerm_function_app" {
  description = "Application function name"
  value       = join("", azurerm_function_app.func_app.*.name)
}
