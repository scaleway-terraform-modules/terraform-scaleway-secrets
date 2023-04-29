output "secret_id" {
  value       = scaleway_secret.this.id
  description = "ID of the Secret"
}

output "secret_status" {
  value       = scaleway_secret.this.status
  description = "Status of the Secret."
}

output "secret_version" {
  value       = scaleway_secret.this.version_count
  description = "Number of versions for this Secret."
}

output "version_data" {
  value       = scaleway_secret_version.this.data
  description = "Data payload (base64 encoded) of the Secret version."
  sensitive   = true
}

output "version_id" {
  value       = scaleway_secret_version.this.id
  description = "ID of the Secret version."
}

output "version_revision" {
  value       = scaleway_secret_version.this.revision
  description = "Revision for this Secret Version."
}

output "version_status" {
  value       = scaleway_secret_version.this.status
  description = "Status of this Secret Version."
}

output "version_creation_date" {
  value       = scaleway_secret_version.this.created_at
  description = "Date and time of Secret version's creation (RFC 3339 format)."
}

output "version_update_date" {
  value       = scaleway_secret_version.this.updated_at
  description = "Date and time of Secret version's last update (RFC 3339 format)."
}

