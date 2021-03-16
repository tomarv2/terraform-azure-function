resource "azurerm_application_insights" "appinsight" {
  count = var.deploy_app_insights ? 1 : 0

  name                = var.app_insights_name != null ? var.app_insights_name : "${var.teamid}-${var.prjid}"
  location            = var.rg_location
  resource_group_name = var.rg_name
  application_type    = var.appinsight_type
  retention_in_days   = var.appinsight_retention_in_days

  tags = merge(local.shared_tags)
}