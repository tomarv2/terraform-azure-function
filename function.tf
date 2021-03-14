resource "azurerm_function_app" "func_app" {
  count = var.deploy_function ? 1 : 0

  name                       = var.function_app_name != null ? var.function_app_name : "${var.teamid}-${var.prjid}"
  location                   = var.rg_location
  resource_group_name        = var.rg_name
  os_type                    = var.function_os_type
  app_service_plan_id        = join("", azurerm_app_service_plan.service_plan.*.id)
  storage_account_name       = var.stg_account
  storage_account_access_key = var.stg_account_key
  tags                       = merge(local.shared_tags)
  version                    = var.function_version
  enabled                    = var.function_enabled
  enable_builtin_logging     = var.function_enable_logging

  https_only = var.function_https_only

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = join("", azurerm_application_insights.appinsight.*.instrumentation_key)
    FUNCTIONS_EXTENSION_VERSION    = var.function_extension_version
    FUNCTIONS_WORKER_RUNTIME       = var.function_worker_runtime
    # WEBSITE_CONTENTAZUREFILECONNECTIONSTRING    = azurerm_storage_account.prod.primary_connection_string
    # WEBSITE_CONTENTSHARE                        = var.storage_account_name
    PYTHONDONTWRITEBYTECODE  = var.python_dont_write_byte_code
    WEBSITE_RUN_FROM_PACKAGE = var.website_run_from_package
  }

  # site_config {
  #   linux_fx_version                            = var.linux_fx_version
  #   always_on                                   = var.site_config_always_on 
  #   use_32_bit_worker_process                   = var.use_32_bit_worker_process
  # }

  identity {
    type = var.identity_type
  }
}


# resource "null_resource" "functions" {
#   triggers = {
#     functions = "${local.version}_${join("+", [ for value in local.functions : value["name"] ])}"
#   }

#   provisioner "local-exec" {
#     command = "cd ..; func azure functionapp publish ${local.app_name}"
#     # command = "cd ..; func azure functionapp publish ${local.app_name}; cd terraform"
#   }
# }

# locals {
#   app_name  = yamldecode(file("config.yaml"))["name"]
#   version   = yamldecode(file("config.yaml"))["version"]
#   functions = yamldecode(file("config.yaml"))["functions"]
# }