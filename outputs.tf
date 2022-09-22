output "name" {
  description = "Application function name"
  value       = [for function in azurerm_function_app.func_app : function.name]
}
