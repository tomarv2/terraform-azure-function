terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 2.98"
    }
  }
}

provider "azurerm" {
  features {}
}

module "function" {
  source                     = "../../"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  storage_account_access_key = module.storage_account.storage_account_access_key
  storage_account_name       = module.storage_account.storage_account_name
  source_dir                 = "sample-functions/function-helloworld-python"
  output_path                = "/tmp/test.zip"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_account" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/account"

  resource_group_name = var.resource_group_name
  location            = var.location
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_container" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/container"

  container_names      = [var.container_name]
  storage_account_name = module.storage_account.storage_account_name
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_blob" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/blob"

  blob_name              = "example"
  blob_source            = "example.txt"
  storage_container_name = var.container_name
  storage_account_name   = module.storage_account.storage_account_name
}
