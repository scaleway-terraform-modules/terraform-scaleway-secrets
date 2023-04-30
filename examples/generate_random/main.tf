provider "scaleway" {
}

provider "random" {
}

data "scaleway_account_project" "default" {
  name = "default"
}

locals {
  region             = "pl-waw"
  secret_description = "Example secret"
  secret_name        = "example-secret"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

module "secret" {
  source = "../.."

  name        = local.secret_name
  data        = random_password.password.result
  description = local.secret_description
  project_id  = data.scaleway_account_project.default.id
  region      = local.region
}
