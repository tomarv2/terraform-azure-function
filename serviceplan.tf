resource "azurerm_app_service_plan" "service_plan" {

  name                          = "${var.teamid}-${var.prjid}-service-plan"
  location                      = var.rg_location
  resource_group_name           = var.rg_name
  kind                          = var.service_plan_kind
  reserved                      = var.service_plan_reserved

  sku {
    tier                        = var.service_plan_tier
    size                        = var.service_plan_size
  }
}
