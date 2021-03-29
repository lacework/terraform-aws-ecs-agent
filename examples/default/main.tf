provider "aws" {
  region = "us-east-1"
}

module "lacework_ecs_datacollector" {
  source = "../../"

  ecs_cluster_name      = "Example-Cluster"
  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
}
