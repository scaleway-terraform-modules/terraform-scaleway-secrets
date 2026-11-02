# Database credentials

This example shows how to store database credentials into Scaleway Secret Manager as a typed secret, with a path and an ephemeral policy.

- `type = "database_credentials"` tells Secret Manager the expected format: a JSON object with `engine`, `username`, `password`, `host`, `dbname` and `port`.
- `path` groups the secret with others, like a folder. It must start with `/`.
- `ephemeral_policy` disables each version 30 days after its creation. A policy must set `ttl`, `expires_once_accessed = true`, or both.
- The password comes from an `ephemeral "random_password"` resource and is set with `data_wo`, so it's never stored in the Terraform state. See the [write-only](../write-only) example for details.

## Usage

Configure the [scaleway provider](https://www.terraform.io/docs/providers/scaleway/index.html) with your own credentials, then:

```sh
terraform init
terraform apply
```
