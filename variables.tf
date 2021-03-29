variable "ecs_cluster_name" {
  type        = string
  description = "The name of the ECS cluster in which to deploy the Lacework agent"
}

variable "ecs_service_name" {
  type        = string
  description = "The desired name for the Lacework agent's ECS Service"
  default     = "lacework-datacollector"
}

variable "ecs_task_family" {
  type        = string
  description = "The desired name of the Lacework agent's ECS Task Definition"
  default     = "lacework-datacollector"
}

variable "ecs_task_role" {
  type        = string
  description = "The name of the IAM Role to use when executing the ECS task"
  default     = "ecsTaskExecutionRole"
}

variable "ecs_cpu_for_lacework" {
  type        = string
  description = "The quantity of CPU units to assign to the task"
  default     = "512"
}

variable "ecs_mem_for_lacework" {
  type        = string
  description = "The quantity of Memory (MiB) to assign to the task"
  default     = "512"
}

variable "lacework_access_token" {
  type        = string
  description = "The access token for the Lacework agent"
}
