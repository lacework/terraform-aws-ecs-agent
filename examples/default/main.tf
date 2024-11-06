provider "aws" {}

resource "lacework_agent_access_token" "ecs" {
  name        = "prod"
  description = "ecs deployment for production env"
}

module "lacework_ecs_datacollector" {
  source = "../../"

  ecs_cluster_arn       = "arn:aws:ecs:us-east-1:123456789012:cluster/example-cluster"
  lacework_access_token = lacework_agent_access_token.ecs.token
}
