data "azurerm_storage_account_sas" "stg_with_sas" {
  count = var.deploy_sas ? 1 : 0

  connection_string = var.stg_connection_string_for_sas
  https_only        = var.stg_connection
  resource_types {
    service   = false
    container = false
    object    = true
  }
  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }
  start  = "2020-08-03"
  expiry = "2028-03-21"
  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
  }
}