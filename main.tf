resource "azurerm_function_app" "func_app" {
  count = var.deploy_function ? 1 : 0

  name                = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type

  app_service_plan_id = join("", azurerm_app_service_plan.service_plan.*.id)

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                    = "~${var.function_version}"
  enabled                    = var.enabled
  enable_builtin_logging     = var.enable_logging
  https_only                 = var.https_only

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME              = "python"
    FUNCTION_APP_EDIT_MODE                = "readonly"
    https_only                            = true
    APPINSIGHTS_INSTRUMENTATIONKEY        = var.app_insights_intrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.app_insights_connection_string
    WEBSITE_RUN_FROM_PACKAGE              = ""
    storage_name                          = var.storage_account_name
  }

  dynamic "site_config" {
    for_each = [var.site_config]
    content {
      always_on                   = lookup(site_config.value, "always_on", null)
      ftps_state                  = lookup(site_config.value, "ftps_state", null)
      http2_enabled               = lookup(site_config.value, "http2_enabled", null)
      ip_restriction              = lookup(site_config.value, "ip_restriction", null)
      linux_fx_version            = lookup(site_config.value, "linux_fx_version", null)
      min_tls_version             = lookup(site_config.value, "min_tls_version", null)
      pre_warmed_instance_count   = lookup(site_config.value, "pre_warmed_instance_count", null)
      scm_ip_restriction          = lookup(site_config.value, "scm_ip_restriction", null)
      scm_type                    = lookup(site_config.value, "scm_type", null)
      scm_use_main_ip_restriction = lookup(site_config.value, "scm_use_main_ip_restriction", null)
      use_32_bit_worker_process   = lookup(site_config.value, "use_32_bit_worker_process", null)
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
