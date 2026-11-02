output "secret_id" {
  description = "ID of the secret."
  value       = module.secret.secret_id
}

output "version_status" {
  description = "Status of the secret version."
  value       = module.secret.version_status
}

output "secret" {
  description = "Generated password, as stored in the secret."
  value       = module.secret.version_data
  sensitive   = true
}
