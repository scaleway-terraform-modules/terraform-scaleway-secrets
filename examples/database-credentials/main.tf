provider "scaleway" {}

# Secret Manager requires a project ID: use the default project, unless
# `default_project_id` is set in the provider configuration.
data "scaleway_account_project" "default" {
  name = "default"
}

ephemeral "random_password" "password" {
  length  = 24
  special = false
}

module "secret" {
  source = "../.."

  name = "example-database-credentials"
  path = "/example/database"
  type = "database_credentials"

  # Disable each version 30 days after its creation.
  ephemeral_policy = {
    ttl    = "720h"
    action = "disable"
  }

  data_wo = jsonencode({
    engine   = "mysql"
    username = "app"
    password = ephemeral.random_password.password.result
    host     = "db.example.net"
    dbname   = "app"
    port     = "3306"
  })
  data_wo_version = 1
  project_id      = data.scaleway_account_project.default.id
}
