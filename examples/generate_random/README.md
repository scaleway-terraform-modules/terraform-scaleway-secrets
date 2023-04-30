# Simple domain

This example shows how to generate a random password and store it into Scaleway Secrets Manager.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

To get the random password, type the following command:

```bash
$ jq -r .outputs.secret.value terraform.tfstate
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13 |
| <a name="requirement_random"></a> [random](#requirement_random) | 3.5.1 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement_scaleway) | ~> 2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider_random) | 3.5.1 |
| <a name="provider_scaleway"></a> [scaleway](#provider_scaleway) | 2.17.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_secret"></a> [secret](#module_secret) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/password) | resource |
| [scaleway_account_project.default](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/data-sources/account_project) | data source |
<!-- END_TF_DOCS -->
