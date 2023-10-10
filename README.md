<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-aws-ecs-agent

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-aws-ecs-agent.svg)](https://github.com/lacework/terraform-aws-ecs-agent/releases/)
[![Codefresh build status](https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)](https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to create an ECS Task Definition and Daemon Service for deploying the Lacework Datacollector Agent in an Elastic Container Service (ECS) cluster.

## ECS Task Definition

The `main.tf` file will configure an ECS Task Definition which will then be used to run the Lacework Datacollector container.

## ECS Daemon Service

The `main.tf` file will configure a daemon Service within the specified ECS Cluster which will run the Task Definition above.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_service.lacework_datacollector](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.lacework_datacollector](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.ssm_parameter_store_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ecs_execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm_parameter_store_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_ssm_parameter.lacework_access_token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_id.uniq](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_iam_policy_document.ssm_parameter_store_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#input\_ecs\_cluster\_arn) | The ARN of the ECS cluster in which to deploy the Lacework agent | `string` | n/a | yes |
| <a name="input_ecs_launch_type"></a> [ecs\_launch\_type](#input\_ecs\_launch\_type) | The desired launch type for the Lacework agent ECS Service | `string` | `"EC2"` | no |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | The desired name for the Lacework agent ECS Service | `string` | `""` | no |
| <a name="input_ecs_task_family_name"></a> [ecs\_task\_family\_name](#input\_ecs\_task\_family\_name) | The desired name for the Lacework agent ECS Task Definition | `string` | `""` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | The IAM role ARN to use when `use_existing_iam_role` is `true` | `string` | `""` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | The IAM role name to use when `use_existing_iam_role` is `false` | `string` | `""` | no |
| <a name="input_iam_role_tags"></a> [iam\_role\_tags](#input\_iam\_role\_tags) | The tags to apply to a created IAM role | `map(string)` | `{}` | no |
| <a name="input_lacework_access_token"></a> [lacework\_access\_token](#input\_lacework\_access\_token) | The access token for the Lacework agent | `string` | n/a | yes |
| <a name="input_lacework_datacollector_image"></a> [lacework\_datacollector\_image](#input\_lacework\_datacollector\_image) | The image used to deploy the Lacework datacollector. | `string` | `"lacework/datacollector:latest"` | no |
| <a name="input_lacework_server_url"></a> [lacework\_server\_url](#input\_lacework\_server\_url) | The server URL for the Lacework agent | `string` | `""` | no |
| <a name="input_lacework_task_cpu"></a> [lacework\_task\_cpu](#input\_lacework\_task\_cpu) | The quantity of CPU units to assign to the task | `string` | `"512"` | no |
| <a name="input_lacework_task_mem"></a> [lacework\_task\_mem](#input\_lacework\_task\_mem) | The quantity of Memory (MiB) to assign to the task | `string` | `"512"` | no |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | A prefix that will be use at the beginning of every generated resource | `string` | `"lacework-ecs"` | no |
| <a name="input_ssm_parameter_arn"></a> [ssm\_parameter\_arn](#input\_ssm\_parameter\_arn) | An existing SSM parameter ARN. Can be used when `use_ssm_parameter_store` is `true` | `string` | `""` | no |
| <a name="input_ssm_parameter_encrypted"></a> [ssm\_parameter\_encrypted](#input\_ssm\_parameter\_encrypted) | Set this to `true` if the SSM parameter is/should be encrypted | `bool` | `false` | no |
| <a name="input_ssm_parameter_kms_arn"></a> [ssm\_parameter\_kms\_arn](#input\_ssm\_parameter\_kms\_arn) | The ARN of the KMS key to use when `ssm_parameter_encrypted` is `true` | `string` | `""` | no |
| <a name="input_ssm_parameter_name"></a> [ssm\_parameter\_name](#input\_ssm\_parameter\_name) | The name to use for the Lacework agent access token when using SSM | `string` | `"/lacework/access_token"` | no |
| <a name="input_use_existing_iam_role"></a> [use\_existing\_iam\_role](#input\_use\_existing\_iam\_role) | Set this to `true` to use an existing IAM role | `bool` | `false` | no |
| <a name="input_use_ssm_parameter_store"></a> [use\_ssm\_parameter\_store](#input\_use\_ssm\_parameter\_store) | Set this to `true` to use SSM to store the Lacework agent access token | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of the IAM Role |
| <a name="output_lacework_datacollector_service_arn"></a> [lacework\_datacollector\_service\_arn](#output\_lacework\_datacollector\_service\_arn) | ARN of the created Service |
| <a name="output_lacework_datacollector_task_definition_arn"></a> [lacework\_datacollector\_task\_definition\_arn](#output\_lacework\_datacollector\_task\_definition\_arn) | ARN of the created Task Definition |
| <a name="output_ssm_parameter_arn"></a> [ssm\_parameter\_arn](#output\_ssm\_parameter\_arn) | The ARN of the SSM Parameter |
<!-- END_TF_DOCS -->