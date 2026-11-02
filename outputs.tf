output "secret_id" {
  value       = scaleway_secret.this.id
  description = "ID of the Secret"
}

output "secret_name" {
  value       = scaleway_secret.this.name
  description = "Name of the Secret."
}

output "secret_path" {
  value       = scaleway_secret.this.path
  description = "Path of the Secret."
}

output "secret_project_id" {
  value       = scaleway_secret.this.project_id
  description = "ID of the project containing the Secret."
}

output "secret_region" {
  value       = scaleway_secret.this.region
  description = "Region of the Secret."
}

output "secret_type" {
  value       = scaleway_secret.this.type
  description = "Type of the Secret."
}

output "secret_status" {
  value       = scaleway_secret.this.status
  description = "Status of the Secret."
}

output "secret_version_count" {
  value       = scaleway_secret.this.version_count
  description = "Number of versions for this Secret."
}

output "secret_srn" {
  value       = scaleway_secret.this.srn
  description = "Scaleway Resource Name (SRN) of the Secret."
}

output "secret_creation_date" {
  value       = scaleway_secret.this.created_at
  description = "Date and time of the Secret's creation (RFC 3339 format)."
}

output "secret_update_date" {
  value       = scaleway_secret.this.updated_at
  description = "Date and time of the Secret's last update (RFC 3339 format)."
}

output "version_data" {
  value       = scaleway_secret_version.this.data
  description = "Data payload of the Secret version, as set in `data`. Null when the version is set with `data_wo`, as write-only values are never stored in the state."
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

output "version_srn" {
  value       = scaleway_secret_version.this.srn
  description = "Scaleway Resource Name (SRN) of the Secret version."
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

