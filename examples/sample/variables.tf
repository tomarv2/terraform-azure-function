variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "location" {
  description = " The location/region where the resource is created"
  default     = "westus2"
  type        = string
}

variable "resource_group_name" {
  description = " The name of the resource group"
  type        = string
}

variable "container_name" {
  description = " Storage container name"
  type        = string
  default     = "example"
}
