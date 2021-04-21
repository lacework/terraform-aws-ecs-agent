# terraform-aws-ecs-agent

## Description

A Terraform Module to create an ECS Task Definition and Daemon Service for deploying the Lacework Datacollector Agent in an Elastic Container Service (ECS) cluster.

## ECS Task Definition

The `main.tf` file will configure an ECS Task Definition which will then be used to run the Lacework Datacollector container.

## ECS Daemon Service

The `main.tf` file will configure a daemon Service within the specified ECS Cluster which will run the Task Definition above.

## Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | >= 0.12.0 |

## Providers

| Name   | Version |
| ------ | ------- |
| aws    | n/a     |
| random | n/a     |

## Inputs

| Name                  | Description                                                            | Type          | Default          | Required |
| --------------------- | ---------------------------------------------------------------------- | ------------- | ---------------- | :------: |
| ecs_cluster_arn       | The ARN of the ECS cluster in which to deploy the Lacework agent       | `string`      | n/a              |   yes    |
| ecs_cpu_for_lacework  | The quantity of CPU units to assign to the task                        | `string`      | `"512"`          |    no    |
| ecs_mem_for_lacework  | The quantity of Memory (MiB) to assign to the task                     | `string`      | `"512"`          |    no    |
| ecs_service_name      | The desired name for the Lacework agent ECS Service                    | `string`      | `""`             |    no    |
| ecs_task_family_name  | The desired name of the Lacework agent ECS Task Definition             | `string`      | `""`             |    no    |
| iam_role_arn          | The IAM role ARN to use when use_existing_iam_role is `true`           | `string`      | `""`             |    no    |
| iam_role_name         | The IAM role name to use when use_existing_iam_role is `false`         | `string`      | `""`             |    no    |
| iam_role_tags         | The tags to apply to a created IAM role                                | `map(string)` | `{}`             |    no    |
| lacework_access_token | The access token for the Lacework agent                                | `string`      | n/a              |   yes    |
| resource_prefix       | A prefix that will be use at the beginning of every generated resource | `string`      | `"lacework-ecs"` |    no    |
| use_existing_iam_role | Set this to true to use an existing IAM role                           | `bool`        | `false`          |    no    |

## Outputs

| Name                                       | Description                        |
| ------------------------------------------ | ---------------------------------- |
| iam_role_arn                               | ARN of the IAM Role                |
| lacework_datacollector_service_arn         | ARN of the created Service         |
| lacework_datacollector_task_definition_arn | ARN of the created Task Definition |
