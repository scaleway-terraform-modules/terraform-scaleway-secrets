variable "data" {
  type        = string
  description = "Data payload of the secret version. Must be no larger than 64KiB. Mutually exclusive with `data_wo`; exactly one of the two must be set."
  default     = null
  sensitive   = true

  validation {
    condition     = (var.data != null) != (var.data_wo != null)
    error_message = "Exactly one of 'data' or 'data_wo' must be set."
  }

  validation {
    condition     = var.data == null || try(length(var.data) > 0, false)
    error_message = "'data' must not be empty."
  }

  # length() counts characters: the size in bytes is computed from the base64 encoding, minus its padding.
  validation {
    condition     = var.data == null || try(length(base64encode(var.data)) / 4 * 3 - length(regex("=*$", base64encode(var.data))) <= 65536, false)
    error_message = "'data' must be no larger than 64KiB (65536 bytes)."
  }
}

variable "data_wo" {
  type        = string
  description = "Write-only data payload of the secret version (never stored in Terraform state). Must be no larger than 64KiB. Mutually exclusive with `data`; exactly one of the two must be set. Requires Terraform >= 1.11. Accepts ephemeral values, e.g. from an ephemeral resource. To rotate the value, increment `data_wo_version`."
  default     = null
  sensitive   = true
  ephemeral   = true

  validation {
    condition     = var.data_wo == null || try(length(var.data_wo) > 0, false)
    error_message = "'data_wo' must not be empty."
  }

  # length() counts characters: the size in bytes is computed from the base64 encoding, minus its padding.
  validation {
    condition     = var.data_wo == null || try(length(base64encode(var.data_wo)) / 4 * 3 - length(regex("=*$", base64encode(var.data_wo))) <= 65536, false)
    error_message = "'data_wo' must be no larger than 64KiB (65536 bytes)."
  }
}

variable "data_wo_version" {
  type        = number
  description = "Version marker for `data_wo`. Must be incremented whenever `data_wo` changes to trigger the creation of a new secret version."
  default     = null

  validation {
    condition     = var.data_wo == null || var.data_wo_version != null
    error_message = "'data_wo_version' must be set (and incremented on every change to 'data_wo') when 'data_wo' is used."
  }

  validation {
    condition     = var.data_wo_version == null || try(var.data_wo_version >= 1 && floor(var.data_wo_version) == var.data_wo_version, false)
    error_message = "'data_wo_version' must be an integer greater than or equal to 1."
  }
}

variable "description" {
  type        = string
  description = "Description of the secret."
  default     = null
}

variable "ephemeral_policy" {
  type = object({
    ttl                   = optional(string)
    expires_once_accessed = optional(bool)
    action                = string
  })
  description = "Ephemeral policy of the secret, defining whether/when its versions expire. Set to null (default) to disable."
  default     = null

  validation {
    condition     = var.ephemeral_policy == null || try(contains(["disable", "delete"], var.ephemeral_policy.action), false)
    error_message = "'ephemeral_policy.action' must be one of `disable` or `delete`."
  }

  validation {
    condition     = var.ephemeral_policy == null || try(var.ephemeral_policy.ttl != null || var.ephemeral_policy.expires_once_accessed == true, false)
    error_message = "'ephemeral_policy' must set 'ttl', or 'expires_once_accessed' to `true`."
  }
}

variable "name" {
  type        = string
  description = "Name of the secret."
}

variable "path" {
  type        = string
  description = "Path of the secret. Must start with `/`. Defaults to the provider's default (`/`) when null."
  default     = null

  validation {
    condition     = var.path == null || try(startswith(var.path, "/"), false)
    error_message = "'path' must start with `/`, e.g. `/app/production`."
  }
}

variable "project_id" {
  type        = string
  description = "ID of the project containing the secret. Resource will be created in the project set at the provider level if null."
  default     = null
}

variable "protected" {
  type        = bool
  description = "True if secret protection is enabled. A protected secret cannot be deleted; Terraform will fail to destroy it unless this is set back to false."
  default     = false
  nullable    = false
}

variable "region" {
  type        = string
  description = "Region in which the resource exists. Resource will be created in the region set at the provider level if null."
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags associated with the secret."
  default     = []
  nullable    = false
}

variable "type" {
  type        = string
  description = "Type of the secret. One of: opaque, key_value, database_credentials, certificate, basic_credentials, ssh_key. Defaults to the provider's default (opaque) when null."
  default     = null

  validation {
    condition     = var.type == null || try(contains(["opaque", "key_value", "database_credentials", "certificate", "basic_credentials", "ssh_key"], var.type), false)
    error_message = "'type' must be one of `opaque`, `key_value`, `database_credentials`, `certificate`, `basic_credentials` or `ssh_key`."
  }
}

variable "version_description" {
  type        = string
  description = "Description of the secret version. Defaults to `description` when not set."
  default     = null
}
