locals {
  container_definition_json = jsonencode([
    {
      "environment" : [
        {
          "name" : "LaceworkAccessToken",
          "value" : var.lacework_access_token,
        },
      ],
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

resource "aws_iam_role_policy_attachment" "security_audit_policy_attachment" {
  count = var.use_existing_iam_role ? 0 : 1

  role       = aws_iam_role.ecs_execution[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "lacework_datacollector" {
  family                = local.ecs_task_family_name
  container_definitions = local.container_definition_json

  cpu    = var.ecs_cpu_for_lacework
  memory = var.ecs_mem_for_lacework

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
