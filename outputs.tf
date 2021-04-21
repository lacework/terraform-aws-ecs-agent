output "iam_role_arn" {
  value       = local.iam_role_arn
  description = "ARN of the IAM Role"
}

output "lacework_datacollector_task_definition_arn" {
  description = "ARN of the created Task Definition"
  value       = aws_ecs_task_definition.lacework_datacollector.arn
}

output "lacework_datacollector_service_arn" {
  description = "ARN of the created Service"
  value       = aws_ecs_service.lacework_datacollector.id
}
