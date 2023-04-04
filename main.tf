resource "azurerm_linux_function_app" "func_app" {
  for_each = var.config

  name                = each.key
  location            = try(each.value.location, "westus2")
  resource_group_name = each.value.resource_group

  service_plan_id = each.value.service_plan_id

  storage_account_name       = each.value.storage_account_name
  storage_account_access_key = each.value.storage_account_access_key
  enabled                    = try(each.value.enabled, true)
  https_only                 = try(each.value.https_only, true)

  app_settings = {
    AzureWebJobsStorage                   = "DefaultEndpointsProtocol=https;AccountName=<container_name>;AccountKey=<storage_access_key>"
    ENABLE_ORYX_BUILD                     = true
    FUNCTIONS_EXTENSION_VERSION           = "~3"
    FUNCTIONS_WORKER_RUNTIME              = "python"
    PYTHONDONTWRITEBYTECODE               = 1
    SCM_DO_BUILD_DURING_DEPLOYMENT        = true
    WEBSITE_RUN_FROM_PACKAGE              = "https://<container_name>.blob.core.windows.net/<rg_name>-packages/<zip_name>.zip?sig=12345"
    APPINSIGHTS_INSTRUMENTATIONKEY        = each.value.app_settings.app_insights_instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = each.value.app_settings.app_insights_connection_string
  }

  dynamic "site_config" {
    for_each = [each.value.site_config]
    content {
      always_on                   = lookup(site_config.value, "always_on", null)
      ftps_state                  = lookup(site_config.value, "ftps_state", null)
      http2_enabled               = lookup(site_config.value, "http2_enabled", null)
      ip_restriction              = lookup(site_config.value, "ip_restriction", null)
      linux_fx_version            = lookup(site_config.value, "linux_fx_version", null)
      pre_warmed_instance_count   = lookup(site_config.value, "pre_warmed_instance_count", null)
      scm_ip_restriction          = lookup(site_config.value, "scm_ip_restriction", null)
      scm_type                    = lookup(site_config.value, "scm_type", null)
      scm_use_main_ip_restriction = lookup(site_config.value, "scm_use_main_ip_restriction", null)
      websockets_enabled          = lookup(site_config.value, "websockets_enabled", null)

      dynamic "cors" {
        for_each = lookup(site_config.value, "cors", []) != [] ? ["fake"] : []
        content {
          allowed_origins     = lookup(site_config.value.cors, "allowed_origins", [])
          support_credentials = lookup(site_config.value.cors, "support_credentials", false)
        }
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? ["null"] : []
    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "UserAssigned" ? var.identity_ids : null
    }
  }
  tags = merge(local.shared_tags, var.extra_tags)
}
