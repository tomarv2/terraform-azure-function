module "function" {
  source = "./../../../_modules/azure/function/function"

  subscription_id                       = var.subscription_id
  tenant_id                             = var.tenant_id
  client_id                             = var.client_id
  client_secret                         = var.client_secret

  email                                 = var.email
  rg_name                               = var.rg_name
  stg_account                           = var.stg_account
  stg_account_key                       = var.stg_account_key
  stg_connection_string_for_sas         = var.stg_connection_string_for_sas
  website_run_from_package              =  var.website_run_from_package
  teamid                                = var.prjid
  prjid                                 = var.prjid
}
