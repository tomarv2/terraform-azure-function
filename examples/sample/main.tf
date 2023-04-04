terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 3.21.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_service_plan" "service_plan" {
  name                = "<service_plan_name>"
  location            = var.location
  resource_group_name = "<resource group name>"
  os_type             = "Linux"
  sku_name            = "P1v2"
}


module "function" {
  source = "../../"
  config = {
    "<function_name>" = {
      location                   = var.location
      resource_group             = "<resource group name>"
      storage_account_access_key = "<storage_access_key>"
      storage_account_name       = "<storage_name>"
      service_plan_id            = azurerm_service_plan.service_plan.id
      app_settings = {
        app_insights_instrumentation_key = "<instrumentation_key>"
        app_insights_connection_string   = "<connection_string>"
      }
    }
  }
}
