# terraform-aws-ecs-agent

## Description

A Terraform Module to create an ECS Task Definition and Daemon Service for deploying the Lacework Datacollector Agent in an Elastic Container Service (ECS) cluster.

## ECS Task Definition

The `main.tf` file will configure an ECS Task Definition which will then be used to run the Lacework Datacollector container.

## ECS Daemon Service

The `main.tf` file will configure a daemon Service within the specified ECS Cluster which will run the Task Definition above.

## Inputs

| Name                  | Description                                                       | Type     | Default                    | Required |
| --------------------- | ----------------------------------------------------------------- | -------- | -------------------------- | :------: |
| ecs_cluster_name      | The name of the ECS cluster in which to deploy the Lacework agent | `string` | n/a                        |   yes    |
| ecs_cpu_for_lacework  | The quantity of CPU units to assign to the task                   | `string` | `"512"`                    |    no    |
| ecs_mem_for_lacework  | The quantity of Memory (MiB) to assign to the task                | `string` | `"512"`                    |    no    |
| ecs_service_name      | The desired name for the Lacework agent's ECS Service             | `string` | `"lacework-datacollector"` |    no    |
| ecs_task_family       | The desired name of the Lacework agent's ECS Task Definition      | `string` | `"lacework-datacollector"` |    no    |
| ecs_task_role         | The name of the IAM Role to use when executing the ECS task       | `string` | `"ecsTaskExecutionRole"`   |    no    |
| lacework_access_token | The access token for the Lacework agent                           | `string` | n/a                        |   yes    |

## Outputs

| Name                                       | Description                        |
| ------------------------------------------ | ---------------------------------- |
| lacework_datacollector_service_arn         | ARN of the created Service         |
| lacework_datacollector_task_definition_arn | ARN of the created Task Definition |
