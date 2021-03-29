# Default Elastic Container Service (ECS) Deployment

This example will generate a Task Definition and Daemon Service for deploying the Lacework Datacollector Agent.

```
provider "aws" {
  region = "us-east-1"
}

module "lacework_ecs_datacollector" {
  source = "../../"
  version = "~> 0.1"

  ecs_cluster_name      = "Example-Cluster"
  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
}
```
