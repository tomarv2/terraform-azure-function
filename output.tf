output "app_id" {
  value = join("", azurerm_application_insights.appinsight.*.app_id)
}

output "sas_url_query_string" {
  value = join("", data.azurerm_storage_account_sas.stg_with_sas.*.sas)
}

output "app_service_name" {
  value = join("", azurerm_app_service_plan.service_plan.*.name)
}

output "azurerm_function_app" {
  value = join("", azurerm_function_app.func_app.*.name)
}
