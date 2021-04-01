resource "azurerm_function_app" "func_app" {
  count = var.deploy_function ? 1 : 0

  name                       = var.function_app_name != null ? var.function_app_name : "${var.teamid}-${var.prjid}"
  location                   = var.rg_location
  resource_group_name        = var.rg_name
  os_type                    = var.function_os_type
  app_service_plan_id        = join("", azurerm_app_service_plan.service_plan.*.id)
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  tags                       = merge(local.shared_tags)
  version                    = var.function_version
  enabled                    = var.function_enabled
  enable_builtin_logging     = var.function_enable_logging
  https_only                 = var.function_https_only
  app_settings               = var.app_settings

  identity {
    type = var.identity_type
  }
}
