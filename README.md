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
  version = "0.0.1"

  # insert required variables here
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement_scaleway) | >= 2.16.2 |

## Resources

| Name | Type |
|------|------|
| [scaleway_secret.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/secret) | resource |
| [scaleway_secret_version.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data"></a> [data](#input_data) | Data payload of the secret version. Must be no larger than 64KiB. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input_name) | (Required) Name of the secret. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input_description) | Description of the secret. | `string` | `null` | no |
| <a name="input_project_id"></a> [project_id](#input_project_id) | ID of the project containing the secret. Ressource will be created in the project set at the provider level if null. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input_region) | Region in which the resource exists. Ressource will be created in the region set at the provider level if null. | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Tags associated with the secret. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_id"></a> [secret_id](#output_secret_id) | ID of the Secret |
| <a name="output_secret_status"></a> [secret_status](#output_secret_status) | Status of the Secret. |
| <a name="output_secret_version"></a> [secret_version](#output_secret_version) | Number of versions for this Secret. |
| <a name="output_version_creation_date"></a> [version_creation_date](#output_version_creation_date) | Date and time of Secret version's creation (RFC 3339 format). |
| <a name="output_version_data"></a> [version_data](#output_version_data) | Data payload (base64 encoded) of the Secret version. |
| <a name="output_version_id"></a> [version_id](#output_version_id) | ID of the Secret version. |
| <a name="output_version_revision"></a> [version_revision](#output_version_revision) | Revision for this Secret Version. |
| <a name="output_version_status"></a> [version_status](#output_version_status) | Status of this Secret Version. |
| <a name="output_version_update_date"></a> [version_update_date](#output_version_update_date) | Date and time of Secret version's last update (RFC 3339 format). |
<!-- END_TF_DOCS -->

## Authors

Module is maintained with help from [the community](https://github.com/scaleway-terraform-modules/terraform-scaleway-domain/graphs/contributors).

## License

Mozilla Public License 2.0 Licensed. See [LICENSE](https://github.com/scaleway-terraform-modules/terraform-scaleway-domain/tree/master/LICENSE) for full details.
