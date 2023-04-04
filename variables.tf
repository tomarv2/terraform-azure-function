variable "extra_tags" {
  description = "Additional tags to associate"
  type        = map(string)
  default     = {}
}

variable "config" {
  description = "Azure Function app configuration"
  type        = map(any)
}

