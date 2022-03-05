module "function" {
  source = "../"

  rg_name                        = "test-rg"
  storage_account_access_key     = module.storage_account.storage_account_access_key
  storage_account_name           = module.storage_account.storage_account_name
  storage_account_container_name = module.storage_account.storage_container_names
  output_file_path               = "/tmp/test.zip"
  source_file                    = "example.txt"

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = "1"
    FUNCTIONS_WORKER_RUNTIME = "python"
    HASH                     = base64encode(filesha256("/tmp/app.zip"))
    WEBSITE_RUN_FROM_PACKAGE = "https://example.blob.core.windows.net"
  }


  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_account" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/account"

  rg_name     = "test-rg"
  create_blob = true
  blob_name   = "test2"
  blob_source = "example.txt"

  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_container" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/container"

  container_names = ["test"]

  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "storage_blob" {
  source = "git::git@github.com:tomarv2/terraform-azure-storage-account.git//modules/blob"

  blob_name              = "example"
  blob_source            = "example.txt"
  storage_container_name = "example"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
