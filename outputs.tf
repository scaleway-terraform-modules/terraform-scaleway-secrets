output "secret_creation_date" {
  description = "Date and time of the secret's creation (RFC 3339 format)."
  value       = scaleway_secret.this.created_at
}

output "secret_id" {
  description = "ID of the secret."
  value       = scaleway_secret.this.id
}

output "secret_name" {
  description = "Name of the secret."
  value       = scaleway_secret.this.name
}

output "secret_path" {
  description = "Path of the secret."
  value       = scaleway_secret.this.path
}

output "secret_project_id" {
  description = "ID of the project containing the secret."
  value       = scaleway_secret.this.project_id
}

output "secret_region" {
  description = "Region of the secret."
  value       = scaleway_secret.this.region
}

output "secret_srn" {
  description = "Scaleway Resource Name (SRN) of the secret."
  value       = scaleway_secret.this.srn
}

output "secret_status" {
  description = "Status of the secret."
  value       = scaleway_secret.this.status
}

output "secret_type" {
  description = "Type of the secret."
  value       = scaleway_secret.this.type
}

output "secret_update_date" {
  description = "Date and time of the secret's last update (RFC 3339 format)."
  value       = scaleway_secret.this.updated_at
}

output "secret_version_count" {
  description = "Number of versions of the secret."
  value       = scaleway_secret.this.version_count
}

output "version_creation_date" {
  description = "Date and time of the secret version's creation (RFC 3339 format)."
  value       = scaleway_secret_version.this.created_at
}

output "version_data" {
  description = "Data payload of the secret version, as set in `data`. Null when the version is set with `data_wo`, as write-only values are never stored in the state."
  value       = scaleway_secret_version.this.data
  sensitive   = true
}

output "version_id" {
  description = "ID of the secret version."
  value       = scaleway_secret_version.this.id
}

output "version_revision" {
  description = "Revision of the secret version."
  value       = scaleway_secret_version.this.revision
}

output "version_srn" {
  description = "Scaleway Resource Name (SRN) of the secret version."
  value       = scaleway_secret_version.this.srn
}

output "version_status" {
  description = "Status of the secret version."
  value       = scaleway_secret_version.this.status
}

output "version_update_date" {
  description = "Date and time of the secret version's last update (RFC 3339 format)."
  value       = scaleway_secret_version.this.updated_at
}
