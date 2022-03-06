variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
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



variable "storage_account_name" {
  description = "storage account name"
}

variable "storage_account_access_key" {}

variable "deploy_function" {
  description = "Feature flag, true or false"
  default     = true
  type        = bool
}

variable "deploy_service_plan" {
  description = "Feature flag, true or false"
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

variable "archive_type" {
  default = "zip"
}

variable "app_settings" {
  default     = {}
  description = "Application settings to insert on creating the function app. Following updates will be ignored, and has to be set manually. Updates done on application deploy or in portal will not affect terraform state file."
}

variable "location" {
  description = " The location/region where the resource is created"
  default     = "westus2"
  type        = string
}

variable "extra_tags" {
  description = "Additional tags to associate"
  type        = map(string)
  default     = {}
}

variable "source_dir" {
  description = "Input directory path on local machine to zip"
  type        = string
}

variable "output_path" {
  description = "Output file path on local machine to deploy to lambda"
  type        = string
}

variable "exclude_files" {
  description = "File(s) to exclude in directory from zipping"
  default     = null
  type        = list(any)
}
