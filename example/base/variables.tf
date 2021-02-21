variable "email" {
  description = "email address to be used for tagging (suggestion: use group email address)"
}

variable "stg_account" {}

variable "stg_account_key" {}

variable "stg_connection_string_for_sas" {}

variable "website_run_from_package" {}


variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "rg_name" {
  description = "Resource Group name"
}

variable "stg_connection" {
    type = bool
}

variable "subscription_id" {}

variable "client_id" {}

variable "client_secret" {}

variable "tenant_id" {}