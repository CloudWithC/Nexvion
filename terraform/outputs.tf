# Application Name
output "application_name" {
  description = "Name of the deployed application"
  value       = var.application_name
}

# Deployment Environment
output "deployment_environment" {
  description = "Environment in which the application is deployed"
  value       = var.environment
}

# Application Port
output "application_port" {
  description = "Port used by the Nexvion application"
  value       = var.app_port
}

# Deployment Information File
output "deployment_info_file" {
  description = "Path of the generated deployment information file"
  value       = local_file.deployment_info.filename
}

# Nexvion AWS Security Group ID
output "nexvion_security_group_id" {
  description = "Terraform-managed Nexvion web security group ID"
  value       = aws_security_group.nexvion_web.id
}
