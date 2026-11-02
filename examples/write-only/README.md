# Write-only

This example shows how to generate a random password and store it into Scaleway Secret Manager with `data_wo`, without storing it in the Terraform state.

The password comes from an `ephemeral "random_password"` resource (requires `hashicorp/random` >= 3.7.0), and `data_wo` is a write-only argument: neither is stored in the state. Terraform can't read the password back, so the module's `version_data` output is null: read it from the Scaleway console or API instead.

A new password is generated on every run, but it is only sent to Scaleway when `data_wo_version` changes. To rotate the password, increment `data_wo_version`.

## Usage

Configure the [scaleway provider](https://www.terraform.io/docs/providers/scaleway/index.html) with your own credentials, then:

```sh
terraform init
terraform apply
```
