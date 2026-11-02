output "secret_id" {
  description = "ID of the secret."
  value       = module.secret.secret_id
}

output "version_revision" {
  description = "Revision of the secret version."
  value       = module.secret.version_revision
}
