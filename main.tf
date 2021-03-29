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
      "name" : var.ecs_task_family,
      "privileged" : true
    }
  ])
}

data "aws_ecs_cluster" "ecs_cluster" {
  cluster_name = var.ecs_cluster_name
}

data "aws_iam_role" "ecs_task_role" {
  name = var.ecs_task_role
}

resource "aws_ecs_task_definition" "lacework_datacollector" {
  family                = var.ecs_task_family
  container_definitions = local.container_definition_json

  cpu    = var.ecs_cpu_for_lacework
  memory = var.ecs_mem_for_lacework

  task_role_arn      = data.aws_iam_role.ecs_task_role.arn
  execution_role_arn = data.aws_iam_role.ecs_task_role.arn

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
  name                = var.ecs_service_name
  cluster             = data.aws_ecs_cluster.ecs_cluster.arn
  scheduling_strategy = "DAEMON"
  task_definition     = aws_ecs_task_definition.lacework_datacollector.arn
}
