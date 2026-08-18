resource "scaleway_secret" "this" {
  name        = var.name
  description = var.description
  region      = var.region
  path        = var.path
  project_id  = var.project_id
  tags        = var.tags
  type        = var.type
  protected   = var.protected

  dynamic "ephemeral_policy" {
    for_each = var.ephemeral_policy != null ? [var.ephemeral_policy] : []
    content {
      ttl                   = ephemeral_policy.value.ttl
      expires_once_accessed = ephemeral_policy.value.expires_once_accessed
      action                = ephemeral_policy.value.action
    }
  }
}

resource "scaleway_secret_version" "this" {
  secret_id       = scaleway_secret.this.id
  data            = var.data
  data_wo         = var.data_wo
  data_wo_version = var.data_wo_version
  description     = try(coalesce(var.version_description, var.description), null)
  region          = var.region

  lifecycle {
    precondition {
      condition     = (var.data != null) != (var.data_wo != null)
      error_message = "Exactly one of `data` or `data_wo` must be set."
    }
    precondition {
      condition     = var.data_wo == null || var.data_wo_version != null
      error_message = "`data_wo_version` must be set (and incremented on every change to `data_wo`) when `data_wo` is used."
    }
  }
}
