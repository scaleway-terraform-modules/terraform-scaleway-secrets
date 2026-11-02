provider "scaleway" {}

# Secret Manager requires a project ID: use the default project, unless
# `default_project_id` is set in the provider configuration.
data "scaleway_account_project" "default" {
  name = "default"
}

# Ephemeral resources are never stored in the state. A new password is
# generated on every run, but it is only sent when `data_wo_version` changes.
ephemeral "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

module "secret" {
  source = "../.."

  name            = "example-write-only"
  description     = "Example write-only secret"
  data_wo         = ephemeral.random_password.password.result
  data_wo_version = 1
  project_id      = data.scaleway_account_project.default.id
}
