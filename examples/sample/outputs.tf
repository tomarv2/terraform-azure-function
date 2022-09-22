output "function_app" {
  description = "Application function name"
  value       = module.function.name
}

output "service_plan_name" {
  description = "Service plan name"
  value       = azurerm_service_plan.service_plan.name
}

output "service_plan_id" {
  description = "Service plan id"
  value       = azurerm_service_plan.service_plan.id
}
