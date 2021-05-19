# Default Elastic Container Service (ECS) Deployment

This example shows how to use the Terraform Provider for Lacework to create
a new Lacework Agent Token and generate a Task Definition and Daemon Service
for deploying the Lacework Datacollector Agent.

```hcl
provider "aws" {}

provider "lacework" {}

resource "lacework_agent_access_token" "ecs" {
  name        = "prod"
  description = "ecs deployment for production env"
}

module "lacework_ecs_datacollector" {
  source  = "lacework/ecs-agent/aws"
  version = "~> 0.1"

  ecs_cluster_arn       = "arn:aws:ecs:us-east-1:123456789012:cluster/example-cluster"
  lacework_access_token = lacework_agent_access_token.ecs.token
}
```
