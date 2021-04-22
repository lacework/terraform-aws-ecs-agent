provider "aws" {}

module "lacework_ecs_datacollector" {
  source = "../../"

  ecs_cluster_arn       = "arn:aws:ecs:us-east-1:123456789012:cluster/example-cluster"
  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"

  use_ssm_parameter_store = true
  ssm_parameter_encrypted = true
  ssm_parameter_kms_arn   = "arn:aws:kms:us-east-1:123456789012:key/6e2010aa-27e4-49c6-8887-956abc1caeb9"
}
