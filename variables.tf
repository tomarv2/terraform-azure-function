variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "rg_name" {
  description = "Resource Group name"
}

variable "rg_location" {
  description = "region"
  default     = "westus"
}

variable "service_plan_kind" {
  default     = "FunctionApp"
  description = "for Consumption Plan"
}

variable "function_os_type" {
  default = "linux"
}

variable "function_version" {
  default = "~3"
}

variable "linux_fx_version" {
  default     = "PYTHON|3.8"
  description = "DOCKER|docker_image:docker_image_tag"
}

variable "identity_type" {
  default = "SystemAssigned"
}

variable "service_plan_tier" {
  default     = "Dynamic"
  description = "for Consumption Plan"
}

variable "service_plan_size" {
  default = "Y1"
}

variable "function_extension_version" {
  default = "~3"
}

variable "function_worker_runtime" {
  default = "python"
}

variable "stg_connection" {
  type    = bool
  default = true
}

variable "service_plan_reserved" {
  type        = bool
  default     = true
  description = "false for windows"
}

variable "function_enabled" {
  type    = bool
  default = true
}

variable "function_enable_logging" {
  type    = bool
  default = true
}

variable "function_https_only" {
  type    = bool
  default = false
}

variable "subscription_id" {}

variable "client_id" {}

variable "client_secret" {}

variable "tenant_id" {}

variable "storage_account_name" {
  description = "storage account name"
}

variable "storage_account_access_key" {}

variable "deploy_function" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "deploy_service_plan" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "service_plan_name" {
  default = null
}

variable "function_app_name" {
  default = null
}

variable "storage_account_container_name" {}

variable "source_file" {}

variable "output_file_path" {}

variable "archive_type" {
  default = "zip"
}

variable "app_settings" {
  default     = {}
  description = "Application settings to insert on creating the function app. Following updates will be ignored, and has to be set manually. Updates done on application deploy or in portal will not affect terraform state file."
}