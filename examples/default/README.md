# Default Example

Every Terraform module must have one or more examples.

```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

provider "lacework" {}

module "lacework_module" {
  source  = "lacework/<PROVIDER>/<NAME>"
  version = "~> 0.1"
}
```
