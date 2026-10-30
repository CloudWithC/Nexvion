# Nexvion - Terraform Infrastructure Automation

## Project Overview
This project demonstrates Infrastructure as Code (IaC) using Terraform.

Terraform manages a local deployment information file for the Nexvion application using the HashiCorp Local provider.

## Tools Used
- Terraform v1.16.3
- HashiCorp Local Provider v2.9.1
- Ubuntu Linux
- Docker and Nginx (application deployment context)

## Project Structure
- main.tf: Defines the local Terraform resource.
- variables.tf: Defines configurable application variables.
- outputs.tf: Displays deployment information.
- deployment-info.txt: Generated deployment information.
- .terraform.lock.hcl: Locks provider version selections.

## Implementation
1. Initialize Terraform using terraform init.
2. Format configuration using terraform fmt.
3. Validate configuration using terraform validate.
4. Review infrastructure changes using terraform plan.
5. Apply changes using terraform apply.
6. Verify resources using terraform state list.
7. Display deployment details using terraform output.

## Configurable Variables
- application_name
- environment
- deployment_type
- app_port

## Result
Terraform successfully created and manages the Nexvion deployment information file.

The project demonstrates Terraform providers, resources, variables, outputs, execution plans and state management.

Note: This is a local Terraform demonstration. It does not provision AWS infrastructure.
