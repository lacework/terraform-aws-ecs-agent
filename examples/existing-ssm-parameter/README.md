# Elastic Container Service (ECS) Deployment w/ Existing SSM Parameter

```hcl
provider "aws" {}

module "lacework_ecs_datacollector" {
  source = "lacework/agent/ecs"
  version = "~> 0.1"

  ecs_cluster_arn       = "arn:aws:ecs:us-east-1:123456789012:cluster/example-cluster"
  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"

  use_ssm_parameter_store    = true
  use_existing_ssm_parameter = true
  ssm_parameter_arn          = "arn:aws:ssm:us-east-1:123456789012:parameter/lacework/access_token"
}
```
