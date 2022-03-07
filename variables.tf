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
  type        = string
}

variable "service_plan_kind" {
  default     = "FunctionApp"
  description = "Service plan kind"
  type        = string
}

variable "os_type" {
  description = "Operating System of the function"
  default     = "linux"
  type        = string
}

variable "function_version" {
  description = "Function version"
  default     = 3
  type        = number
}

variable "identity_type" {
  description = "MSI Identity type"
  default     = "SystemAssigned"
  type        = string
}

variable "service_plan_tier" {
  default     = "Dynamic"
  description = "For Consumption Plan"
  type        = string
}

variable "service_plan_size" {
  description = "Service plan size"
  default     = "Y1"
  type        = string
}

variable "service_plan_reserved" {
  description = "Service plan reserved, false for windows"
  type        = bool
  default     = true

}

variable "enabled" {
  description = "Function enabled"
  type        = bool
  default     = true
}

variable "enable_logging" {
  description = "Function enable logging"
  type        = bool
  default     = true
}

variable "https_only" {
  description = "Function https only"
  type        = bool
  default     = false
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "storage_account_access_key" {
  description = "Storage account access key"
  type        = string
}

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
  description = "Service plan name"
  default     = null
  type        = string
}

variable "name" {
  description = "Function app name"
  default     = null
  type        = string
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

variable "archive_type" {
  description = "Archive type"
  default     = "zip"
  type        = string
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

variable "app_settings" {
  default     = {}
  description = "Application settings to insert on creating the function app. Following updates will be ignored, and has to be set manually. Updates done on application deploy or in portal will not affect terraform state file."
}

variable "identity_ids" {
  description = "UserAssigned Identities ID to add to Function App. Mandatory if type is UserAssigned"
  type        = list(string)
  default     = null
}