locals {
  access_token_secret_json = var.use_ssm_parameter_store ? ({
    "secrets" : [
      { "name" : "LaceworkAccessToken", "valueFrom" : local.ssm_parameter_arn }
    ]
  }) : ({})

  environment_json = {
    "environment" : flatten([
      (!var.use_ssm_parameter_store) ? ([{
        "name" : "LaceworkAccessToken", "value" : var.lacework_access_token
      }]) : ([]),
      length(var.lacework_server_url) > 0 ? ([{
        "name" : "LaceworkServerUrl", "value" : var.lacework_server_url
      }]) : ([]),
    ])
  }

  container_definition_json = jsonencode([merge(
    local.access_token_secret_json,
    local.environment_json,
    {
      "essential" : true,
      "image" : "lacework/datacollector",
      "mountPoints" : [
        {
          "readOnly" : true,
          "containerPath" : "/laceworkfim",
          "sourceVolume" : "root"
        },
        {
          "readOnly" : null,
          "containerPath" : "/var/lib/lacework",
          "sourceVolume" : "var_lib_lacework"
        },
        {
          "readOnly" : null,
          "containerPath" : "/var/log",
          "sourceVolume" : "var_log"
        },
        {
          "readOnly" : null,
          "containerPath" : "/var/run",
          "sourceVolume" : "var_run"
        },
        {
          "readOnly" : true,
          "containerPath" : "/etc/passwd",
          "sourceVolume" : "etc_passwd"
        },
        {
          "readOnly" : true,
          "containerPath" : "/etc/group",
          "sourceVolume" : "etc_group"
        }
      ],
      "name" : local.ecs_task_family_name,
      "privileged" : true
    }
  )])
  ecs_service_name     = length(var.ecs_service_name) > 0 ? var.ecs_service_name : "${var.resource_prefix}-service-${random_id.uniq.hex}"
  ecs_task_family_name = length(var.ecs_task_family_name) > 0 ? var.ecs_task_family_name : "${var.resource_prefix}-task-${random_id.uniq.hex}"
  iam_role_arn         = var.use_existing_iam_role ? var.iam_role_arn : aws_iam_role.ecs_execution[0].arn
  iam_role_name        = (!var.use_existing_iam_role && length(var.iam_role_name) > 0) ? var.iam_role_name : "${var.resource_prefix}-role-${random_id.uniq.hex}"
  ssm_parameter_arn    = (var.use_ssm_parameter_store && length(var.ssm_parameter_arn) > 0) ? var.ssm_parameter_arn : aws_ssm_parameter.lacework_access_token[0].arn
}

resource "random_id" "uniq" {
  byte_length = 4
}

resource "aws_iam_role" "ecs_execution" {
  count = var.use_existing_iam_role ? 0 : 1

  name = local.iam_role_name
  tags = var.iam_role_tags

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy_attachment" {
  count = var.use_existing_iam_role ? 0 : 1

  role       = aws_iam_role.ecs_execution[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ssm_parameter_store_policy" {
  count = (!var.use_existing_iam_role && var.use_ssm_parameter_store) ? 1 : 0

  version = "2012-10-17"

  statement {
    sid       = "GetSsmParameter"
    actions   = ["ssm:GetParameters"]
    resources = [local.ssm_parameter_arn]
  }

  dynamic "statement" {
    for_each = var.ssm_parameter_encrypted ? [1] : []
    content {
      sid       = "DecryptSsmParameter"
      actions   = ["kms:Decrypt"]
      resources = [var.ssm_parameter_kms_arn]
    }
  }
}

resource "aws_iam_policy" "ssm_parameter_store_policy" {
  count = (!var.use_existing_iam_role && var.use_ssm_parameter_store) ? 1 : 0

  name        = local.iam_role_name
  description = "An IAM policy to allow a Lacework Agent ECS task to pull the agent access token from SSM"
  policy      = data.aws_iam_policy_document.ssm_parameter_store_policy[count.index].json
}

resource "aws_iam_role_policy_attachment" "ssm_parameter_store_iam_role_policy" {
  count = (!var.use_existing_iam_role && var.use_ssm_parameter_store) ? 1 : 0

  role       = local.iam_role_name
  policy_arn = aws_iam_policy.ssm_parameter_store_policy[count.index].arn
}

resource "aws_ecs_task_definition" "lacework_datacollector" {
  family                = local.ecs_task_family_name
  container_definitions = local.container_definition_json

  cpu    = var.lacework_task_cpu
  memory = var.lacework_task_mem

  task_role_arn      = local.iam_role_arn
  execution_role_arn = local.iam_role_arn

  network_mode = "host"
  pid_mode     = "host"

  volume {
    name      = "root"
    host_path = "/"
  }

  volume {
    name      = "var_lib_lacework"
    host_path = "/var/lib/lacework"
  }

  volume {
    name      = "var_log"
    host_path = "/var/log"
  }

  volume {
    name      = "var_run"
    host_path = "/var/run"
  }

  volume {
    name      = "etc_passwd"
    host_path = "/etc/passwd"
  }

  volume {
    name      = "etc_group"
    host_path = "/etc/group"
  }
}

resource "aws_ecs_service" "lacework_datacollector" {
  name                = local.ecs_service_name
  cluster             = var.ecs_cluster_arn
  scheduling_strategy = "DAEMON"
  task_definition     = aws_ecs_task_definition.lacework_datacollector.arn
}

resource "aws_ssm_parameter" "lacework_access_token" {
  count = (var.use_ssm_parameter_store && length(var.ssm_parameter_arn) > 0) ? 0 : 1

  name   = var.ssm_parameter_name
  key_id = var.ssm_parameter_kms_arn
  type   = var.ssm_parameter_encrypted ? "SecureString" : "String"
  value  = var.lacework_access_token
}
