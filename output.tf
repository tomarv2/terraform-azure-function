output "app_id" {
  value = azurerm_application_insights.appinsight.app_id
}

output "sas_url_query_string" {
  value = data.azurerm_storage_account_sas.stg_with_sas.sas
}

output "app_service_name" {
  value = azurerm_app_service_plan.service_plan.name
}

output "azurerm_function_app" {
  value = azurerm_function_app.func_app.name
}
