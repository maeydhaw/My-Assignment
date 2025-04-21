variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "deployment_name" {
  type        = string
  description = "The name of this particular deployment."
  default     = "three-tier-app"
}