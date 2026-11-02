output "secret_id" {
  description = "ID of the secret."
  value       = module.secret.secret_id
}

output "secret_path" {
  description = "Path of the secret."
  value       = module.secret.secret_path
}

output "secret_type" {
  description = "Type of the secret."
  value       = module.secret.secret_type
}
