provider "scaleway" {}

# Secret Manager requires a project ID: use the default project, unless
# `default_project_id` is set in the provider configuration.
data "scaleway_account_project" "default" {
  name = "default"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

module "secret" {
  source = "../.."

  name        = "example-random-password"
  description = "Example secret"
  data        = random_password.password.result
  project_id  = data.scaleway_account_project.default.id
}
