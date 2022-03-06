resource "azurerm_app_service_plan" "service_plan" {
  count = var.deploy_service_plan ? 1 : 0

  name                = var.service_plan_name != null ? var.service_plan_name : "${var.teamid}-${var.prjid}"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.service_plan_kind
  reserved            = var.service_plan_reserved

  sku {
    tier = var.service_plan_tier
    size = var.service_plan_size
  }
  tags = merge(local.shared_tags, var.extra_tags)
}
