# Terraform / Scaleway

## Purpose

This repository is used to manage secrets on scaleway using terraform. 
~> **Important:** Beware that secret's values won't be displayed on plan/apply, netherless it will be stored in the state file. For more information, see [Sensitive Data in State](https://developer.hashicorp.com/terraform/language/state/sensitive-data).

## Usage

- Setup the [scaleway provider](https://www.terraform.io/docs/providers/scaleway/index.html) in your tf file.
- Include this module in your tf file. Refer to [documentation](https://www.terraform.io/docs/modules/sources.html#generic-git-repository).

```hcl
module "my_service" {
  source  = "scaleway-terraform-modules/secrets/scaleway"
  version = "~> 1.0"

  # insert required variables here
}
```

### Secret types, protection & ephemeral policy

```hcl
module "db_secret" {
  source  = "scaleway-terraform-modules/secrets/scaleway"
  version = "~> 1.0"

  name      = "db-credentials"
  type      = "database_credentials"
  protected = true

  ephemeral_policy = {
    ttl                   = "24h"
    expires_once_accessed = true
    action                = "delete"
  }

  data = jsonencode({
    engine   = "mysql"
    username = "u"
    password = "p"
    host     = "h"
    dbname   = "d"
    port     = "3306"
  })
}
```

### Write-only data

Use `data_wo` instead of `data` to avoid persisting the secret value in the Terraform state. Requires Terraform >= 1.11. Bump `data_wo_version` every time `data_wo` changes to trigger a new secret version.

```hcl
module "api_key" {
  source  = "scaleway-terraform-modules/secrets/scaleway"
  version = "~> 1.0"

  name            = "api-key"
  data_wo         = var.api_key
  data_wo_version = 1
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.11 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement_scaleway) | >= 2.79.0 |

## Resources

| Name | Type |
|------|------|
| [scaleway_secret.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/secret) | resource |
| [scaleway_secret_version.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input_name) | (Required) Name of the secret. | `string` | n/a | yes |
| <a name="input_data"></a> [data](#input_data) | Data payload of the secret version. Must be no larger than 64KiB. Mutually exclusive with `data_wo`; exactly one of the two must be set. | `string` | `null` | no |
| <a name="input_data_wo"></a> [data_wo](#input_data_wo) | Write-only data payload of the secret version (never stored in Terraform state). Must be no larger than 64KiB. Mutually exclusive with `data`; exactly one of the two must be set. Requires Terraform >= 1.11. To rotate the value, increment `data_wo_version`. | `string` | `null` | no |
| <a name="input_data_wo_version"></a> [data_wo_version](#input_data_wo_version) | Version marker for `data_wo`. Must be incremented whenever `data_wo` changes to trigger the creation of a new secret version. | `number` | `null` | no |
| <a name="input_description"></a> [description](#input_description) | Description of the secret. | `string` | `null` | no |
| <a name="input_ephemeral_policy"></a> [ephemeral_policy](#input_ephemeral_policy) | Ephemeral policy of the secret, defining whether/when its versions expire. Set to null (default) to disable. | ```object({ ttl = optional(string) expires_once_accessed = optional(bool) action = string })``` | `null` | no |
| <a name="input_path"></a> [path](#input_path) | Path of the secret. | `string` | `null` | no |
| <a name="input_project_id"></a> [project_id](#input_project_id) | ID of the project containing the secret. Resource will be created in the project set at the provider level if null. | `string` | `null` | no |
| <a name="input_protected"></a> [protected](#input_protected) | True if secret protection is enabled. A protected secret cannot be deleted; Terraform will fail to destroy it unless this is set back to false. | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input_region) | Region in which the resource exists. Resource will be created in the region set at the provider level if null. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Tags associated with the secret. | `list(string)` | `[]` | no |
| <a name="input_type"></a> [type](#input_type) | Type of the secret. One of: opaque, key_value, database_credentials, certificate, basic_credentials, ssh_key. Defaults to the provider's default (opaque) when null. | `string` | `null` | no |
| <a name="input_version_description"></a> [version_description](#input_version_description) | Description of the secret version. Defaults to `description` when not set. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_creation_date"></a> [secret_creation_date](#output_secret_creation_date) | Date and time of the Secret's creation (RFC 3339 format). |
| <a name="output_secret_id"></a> [secret_id](#output_secret_id) | ID of the Secret |
| <a name="output_secret_srn"></a> [secret_srn](#output_secret_srn) | Scaleway Resource Name (SRN) of the Secret. |
| <a name="output_secret_status"></a> [secret_status](#output_secret_status) | Status of the Secret. |
| <a name="output_secret_update_date"></a> [secret_update_date](#output_secret_update_date) | Date and time of the Secret's last update (RFC 3339 format). |
| <a name="output_secret_version"></a> [secret_version](#output_secret_version) | Number of versions for this Secret. |
| <a name="output_version_creation_date"></a> [version_creation_date](#output_version_creation_date) | Date and time of Secret version's creation (RFC 3339 format). |
| <a name="output_version_data"></a> [version_data](#output_version_data) | Data payload (base64 encoded) of the Secret version. |
| <a name="output_version_id"></a> [version_id](#output_version_id) | ID of the Secret version. |
| <a name="output_version_revision"></a> [version_revision](#output_version_revision) | Revision for this Secret Version. |
| <a name="output_version_srn"></a> [version_srn](#output_version_srn) | Scaleway Resource Name (SRN) of the Secret version. |
| <a name="output_version_status"></a> [version_status](#output_version_status) | Status of this Secret Version. |
| <a name="output_version_update_date"></a> [version_update_date](#output_version_update_date) | Date and time of Secret version's last update (RFC 3339 format). |
<!-- END_TF_DOCS -->

## Authors

Module is maintained with help from [the community](https://github.com/scaleway-terraform-modules/terraform-scaleway-secrets/graphs/contributors).

## License

Mozilla Public License 2.0 Licensed. See [LICENSE](https://github.com/scaleway-terraform-modules/terraform-scaleway-secrets/tree/master/LICENSE) for full details.
