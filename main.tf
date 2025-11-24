resource "scaleway_secret" "this" {
  name        = var.name
  description = var.description
  region      = var.region
  path        = var.path
  project_id  = var.project_id
  tags        = var.tags
}

resource "scaleway_secret_version" "this" {
  secret_id   = scaleway_secret.this.id
  data        = var.data
  description = var.description
  region      = var.region
}
