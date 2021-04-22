# Elastic Container Service (ECS) Deployment w/ Existing IAM Role

```
provider "aws" {}

module "lacework_ecs_datacollector" {
  source = "lacework/ecs-agent/aws"
  version = "~> 0.1"

  ecs_cluster_arn       = "arn:aws:ecs:us-east-1:123456789012:cluster/example-cluster"
  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"

  use_existing_iam_role = true
  iam_role_arn          = "arn:aws:iam::123456789012:role/lacework-ecs-role-a8c32943"
}
```
