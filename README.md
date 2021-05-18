<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-aws-ecs-agent

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-aws-ecs-agent.svg)](https://github.com/lacework/terraform-aws-ecs-agent/releases/)
[![Codefresh build status](https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)](https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to create an ECS Task Definition and Daemon Service for deploying the Lacework Datacollector Agent in an Elastic Container Service (ECS) cluster.

## ECS Task Definition

The `main.tf` file will configure an ECS Task Definition which will then be used to run the Lacework Datacollector container.

## ECS Daemon Service

The `main.tf` file will configure a daemon Service within the specified ECS Cluster which will run the Task Definition above.

## Requirements

| Name      | Version    |
| --------- | ---------- |
| terraform | >= 0.12.31 |

## Providers

| Name   | Version |
| ------ | ------- |
| aws    | n/a     |
| random | n/a     |

## Inputs

| Name                    | Description                                                                         | Type          | Default                    | Required |
| ----------------------- | ----------------------------------------------------------------------------------- | ------------- | -------------------------- | :------: |
| ecs_cluster_arn         | The ARN of the ECS cluster in which to deploy the Lacework agent                    | `string`      | n/a                        |   yes    |
| ecs_service_name        | The desired name for the Lacework agent ECS Service                                 | `string`      | `""`                       |    no    |
| ecs_task_family_name    | The desired name for the Lacework agent ECS Task Definition                         | `string`      | `""`                       |    no    |
| iam_role_arn            | The IAM role ARN to use when `use_existing_iam_role` is `true`                      | `string`      | `""`                       |    no    |
| iam_role_name           | The IAM role name to use when `use_existing_iam_role` is `false`                    | `string`      | `""`                       |    no    |
| iam_role_tags           | The tags to apply to a created IAM role                                             | `map(string)` | `{}`                       |    no    |
| lacework_access_token   | The access token for the Lacework agent                                             | `string`      | n/a                        |   yes    |
| lacework_server_url     | The server URL for the Lacework agent                                               | `string`      | `""`                       |    no    |
| lacework_task_cpu       | The quantity of CPU units to assign to the task                                     | `string`      | `"512"`                    |    no    |
| lacework_task_mem       | The quantity of Memory (MiB) to assign to the task                                  | `string`      | `"512"`                    |    no    |
| resource_prefix         | A prefix that will be use at the beginning of every generated resource              | `string`      | `"lacework-ecs"`           |    no    |
| ssm_parameter_arn       | An existing SSM parameter ARN. Can be used when `use_ssm_parameter_store` is `true` | `string`      | `""`                       |    no    |
| ssm_parameter_encrypted | Set this to `true` if the SSM parameter is/should be encrypted                      | `bool`        | `false`                    |    no    |
| ssm_parameter_kms_arn   | The ARN of the KMS key to use when `ssm_parameter_encrypted` is `true`              | `string`      | `""`                       |    no    |
| ssm_parameter_name      | The name to use for the Lacework agent access token when using SSM                  | `string`      | `"/lacework/access_token"` |    no    |
| use_existing_iam_role   | Set this to `true` to use an existing IAM role                                      | `bool`        | `false`                    |    no    |
| use_ssm_parameter_store | Set this to `true` to use SSM to store the Lacework agent access token              | `bool`        | `false`                    |    no    |

## Outputs

| Name                                       | Description                        |
| ------------------------------------------ | ---------------------------------- |
| iam_role_arn                               | ARN of the IAM Role                |
| lacework_datacollector_service_arn         | ARN of the created Service         |
| lacework_datacollector_task_definition_arn | ARN of the created Task Definition |
| ssm_parameter_arn                          | The ARN of the SSM Parameter       |
