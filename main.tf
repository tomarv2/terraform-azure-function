resource "azurerm_function_app" "func_app" {
  count = var.deploy_function ? 1 : 0

  name                       = var.function_app_name != null ? var.function_app_name : "${var.teamid}-${var.prjid}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  os_type                    = var.function_os_type
  app_service_plan_id        = join("", azurerm_app_service_plan.service_plan.*.id)
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                    = var.function_version
  enabled                    = var.function_enabled
  enable_builtin_logging     = var.function_enable_logging
  https_only                 = var.function_https_only
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
    HASH                     = base64encode(filesha256(data.archive_file.zip_dir.output_path))
    WEBSITE_RUN_FROM_PACKAGE = "https://${var.storage_account_name}.blob.core.windows.net"
  }

  identity {
    type = var.identity_type
  }
  tags = merge(local.shared_tags, var.extra_tags)
}
