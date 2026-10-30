terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "local_file" "deployment_info" {
  filename = "${path.module}/deployment-info.txt"

  file_permission      = "0644"
  directory_permission = "0755"

  content = <<-EOT
    Nexvion Deployment Infrastructure
    ==================================
    Application: ${var.application_name}
    Environment: ${var.environment}
    Deployment: ${var.deployment_type}
    Port: ${var.app_port}
    Managed By: Terraform
    Cloud Provider: AWS
    AWS Region: eu-north-1
  EOT
}

resource "aws_security_group" "nexvion_web" {
  name        = "nexvion-web-sg"
  description = "Security group for Nexvion web application"
  vpc_id      = "vpc-0b7f2298f6f7c57f9"

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "nexvion-web-sg"
    Project     = "Nexvion"
    ManagedBy   = "Terraform"
    Environment = "Development"
  }
}
