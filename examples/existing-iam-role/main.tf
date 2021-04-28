provider "aws" {}

module "lacework_ecs_datacollector" {
  source = "../../"

  ecs_cluster_arn       = "arn:aws:ecs:us-east-1:123456789012:cluster/example-cluster"
  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"

  use_existing_iam_role = true
  iam_role_arn          = "arn:aws:iam::123456789012:role/lacework-ecs-role-a8c32943"
}
