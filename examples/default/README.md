# Default Elastic Container Service (ECS) Deployment

This example will generate a Task Definition and Daemon Service for deploying the Lacework Datacollector Agent.

```
provider "aws" {}

module "lacework_ecs_datacollector" {
  source = "lacework/agent/ecs"
  version = "~> 0.1"

  ecs_cluster_arn       = "arn:aws:ecs:us-east-1:123456789012:cluster/example-cluster"
  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
}
```
