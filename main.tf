resource "azurerm_function_app" "func_app" {
  count = var.deploy_function ? 1 : 0

  name                       = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  os_type                    = var.os_type

  app_service_plan_id        = join("", azurerm_app_service_plan.service_plan.*.id)

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                    = "~${var.function_version}"
  enabled                    = var.enabled
  enable_builtin_logging     = var.enable_logging
  https_only                 = var.https_only

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
    #HASH                     = base64encode(filesha256(data.archive_file.zip_dir[0].output_path))
    #WEBSITE_RUN_FROM_PACKAGE = "https://${var.storage_account_name}.blob.core.windows.net/example${var.output_path}"
  }

  site_config {
    linux_fx_version = "PYTHON|3.7"
    use_32_bit_worker_process = false
    ftps_state = "Disabled"
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? ["null"] : []
    content {
      type = var.identity_type
      identity_ids = var.identity_type == "UserAssigned" ? var.identity_ids : null
    }
  }
  tags = merge(local.shared_tags, var.extra_tags)
}
