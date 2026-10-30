variable "application_name" {
  description = "Name of the application"
  type        = string
  default     = "Nexvion"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "Development"
}

variable "deployment_type" {
  description = "Application deployment technology"
  type        = string
  default     = "Docker + Nginx"
}

variable "app_port" {
  description = "Application port"
  type        = number
  default     = 8088
}
