variable "ecs_cluster_arn" {
  type        = string
  description = "The ARN of the ECS cluster in which to deploy the Lacework agent"
}

variable "ecs_service_name" {
  type        = string
  description = "The desired name for the Lacework agent ECS Service"
  default     = ""
}

variable "ecs_task_family_name" {
  type        = string
  description = "The desired name for the Lacework agent ECS Task Definition"
  default     = ""
}

variable "iam_role_arn" {
  type        = string
  default     = ""
  description = "The IAM role ARN to use when `use_existing_iam_role` is `true`"
}

variable "iam_role_name" {
  type        = string
  default     = ""
  description = "The IAM role name to use when `use_existing_iam_role` is `false`"
}

variable "iam_role_tags" {
  type        = map(string)
  default     = {}
  description = "The tags to apply to a created IAM role"
}

variable "lacework_access_token" {
  type        = string
  description = "The access token for the Lacework agent"
}

variable "lacework_task_cpu" {
  type        = string
  description = "The quantity of CPU units to assign to the task"
  default     = "512"
}

variable "lacework_task_mem" {
  type        = string
  description = "The quantity of Memory (MiB) to assign to the task"
  default     = "512"
}

variable "resource_prefix" {
  type        = string
  default     = "lacework-ecs"
  description = "A prefix that will be use at the beginning of every generated resource"
}

variable "ssm_parameter_arn" {
  type        = string
  default     = ""
  description = "An existing SSM parameter ARN. Can be used when `use_ssm_parameter_store` is `true`"
}

variable "ssm_parameter_encrypted" {
  type        = bool
  default     = false
  description = "Set this to `true` if the SSM parameter is/should be encrypted"
}

variable "ssm_parameter_kms_arn" {
  type        = string
  default     = ""
  description = "The ARN of the KMS key to use when `ssm_parameter_encrypted` is `true`"
}

variable "ssm_parameter_name" {
  type        = string
  default     = "/lacework/access_token"
  description = "The name to use for the Lacework agent access token when using SSM"
}

variable "use_existing_iam_role" {
  type        = bool
  default     = false
  description = "Set this to `true` to use an existing IAM role"
}

variable "use_ssm_parameter_store" {
  type        = bool
  default     = false
  description = "Set this to `true` to use SSM to store the Lacework agent access token"
}
