provider "aws" {}

module "lacework_ecs_datacollector" {
  source = "../../"

  ecs_cluster_arn       = "arn:aws:ecs:us-east-1:123456789012:cluster/example-cluster"
  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
  lacework_server_url   = "api.lacework.net"
}
