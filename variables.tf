variable "data" {
  description = "Data payload of the secret version. Must be no larger than 64KiB."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.data) > 0 && length(var.data) < 65537
    error_message = "The secret value must be less than 64kb."
  }
}

variable "name" {
  description = "(Required) Name of the secret."
  type        = string
}

variable "description" {
  description = "Description of the secret."
  type        = string
  default     = null
}

variable "region" {
  description = "Region in which the resource exists. Ressource will be created in the region set at the provider level if null."
  type        = any
  default     = null
}

variable "project_id" {
  description = "ID of the project containing the secret. Ressource will be created in the project set at the provider level if null."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags associated with the secret."
  type        = list(string)
  default     = []
}
