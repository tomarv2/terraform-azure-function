resource "azurerm_application_insights" "appinsight" {
  name                          = "${var.teamid}-${var.prjid}-insights"
  location                      = var.rg_location
  resource_group_name           = var.rg_name
  application_type              = var.appinsight_type
  retention_in_days             = var.appinsight_retention
  tags                          = merge(local.shared_tags) 
}