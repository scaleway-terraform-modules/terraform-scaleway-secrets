variable "data" {
  description = "Data payload of the secret version. Must be no larger than 64KiB. Mutually exclusive with `data_wo`; exactly one of the two must be set."
  type        = string
  sensitive   = true
  default     = null

  validation {
    condition     = var.data == null || try(length(var.data) > 0 && length(var.data) < 65537, false)
    error_message = "The secret value must be less than 64kb."
  }
}

variable "data_wo" {
  description = "Write-only data payload of the secret version (never stored in Terraform state). Must be no larger than 64KiB. Mutually exclusive with `data`; exactly one of the two must be set. Requires Terraform >= 1.11. To rotate the value, increment `data_wo_version`."
  type        = string
  sensitive   = true
  default     = null

  validation {
    condition     = var.data_wo == null || try(length(var.data_wo) > 0 && length(var.data_wo) < 65537, false)
    error_message = "The secret value must be less than 64kb."
  }
}

variable "data_wo_version" {
  description = "Version marker for `data_wo`. Must be incremented whenever `data_wo` changes to trigger the creation of a new secret version."
  type        = number
  default     = null
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

variable "version_description" {
  description = "Description of the secret version. Defaults to `description` when not set."
  type        = string
  default     = null
}

variable "region" {
  description = "Region in which the resource exists. Resource will be created in the region set at the provider level if null."
  type        = string
  default     = null
}

variable "project_id" {
  description = "ID of the project containing the secret. Resource will be created in the project set at the provider level if null."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags associated with the secret."
  type        = list(string)
  default     = []
}

variable "path" {
  description = "Path of the secret."
  type        = string
  default     = null
}

variable "type" {
  description = "Type of the secret. One of: opaque, key_value, database_credentials, certificate, basic_credentials, ssh_key. Defaults to the provider's default (opaque) when null."
  type        = string
  default     = null

  validation {
    condition     = var.type == null || try(contains(["opaque", "key_value", "database_credentials", "certificate", "basic_credentials", "ssh_key"], var.type), false)
    error_message = "The type must be one of: opaque, key_value, database_credentials, certificate, basic_credentials, ssh_key."
  }
}

variable "protected" {
  description = "True if secret protection is enabled. A protected secret cannot be deleted; Terraform will fail to destroy it unless this is set back to false."
  type        = bool
  default     = false
}

variable "ephemeral_policy" {
  description = "Ephemeral policy of the secret, defining whether/when its versions expire. Set to null (default) to disable."
  type = object({
    ttl                   = optional(string)
    expires_once_accessed = optional(bool)
    action                = string
  })
  default = null

  validation {
    condition     = var.ephemeral_policy == null || try(contains(["disable", "delete"], var.ephemeral_policy.action), false)
    error_message = "The `ephemeral_policy.action` must be one of: disable, delete."
  }
}
