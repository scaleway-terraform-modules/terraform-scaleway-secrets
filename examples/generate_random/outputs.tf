output "secret_status" {
  value = module.secret.secret_status
}

output "version_status" {
  value = module.secret.version_status
}

output "secret" {
  value     = module.secret.version_data
  sensitive = true
}
