# Random password

This example shows how to generate a random password and store it into Scaleway Secret Manager with `data`.

The password is stored in the Terraform state, both by `random_password` and by the secret version. To keep it out of the state, see the [write-only](../write-only) example.

## Usage

Configure the [scaleway provider](https://www.terraform.io/docs/providers/scaleway/index.html) with your own credentials, then:

```sh
terraform init
terraform apply
```

To get the password:

```sh
terraform output -raw secret
```
