
# Terraform AWS Infrastructure Project

This Terraform project automates the provisioning of AWS infrastructure, including a Virtual Private Cloud (VPC), EC2 instances, and Security Groups (SG). It also configures the AWS provider, leverages locals for computed values, and uses variables for customization. This README provides an overview of the project, its structure, and instructions for usage.



## Table of Contents

- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Variables](#variables)
- [Locals](#locals)
- [Terraform Commands](#terraform-commands)
- [Terraform Workspaces](#terraform-workspaces)
- [Contributing](#contributing)
- [Appendix](#appendix)
## Project Structure

The project is organized as follows:

- `README.md`: Documentation
- `ec2.tf`: Defines AWS resources for EC2 instances.
- `provider.tf`: Configures the AWS provider.
- `sg.tf`: Defines AWS resources for Security Groups.
- `variables.tf`: Declares input variables used for customization.
- `vpc.tf`: Defines AWS resources for the Virtual Private Cloud (VPC).
- `locals.tf`: Defines local values and computed expressions for use within the configuration.
## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS Access Key and Secret Access Key (configured using `aws configure`)

## Getting Started

1. Clone this repository:
```sh
git clone https://github.com/yourusername/terraform-aws-project.git
cd terraform-aws-project

2. Configure your AWS credentials:
```sh
 aws configure

3. Initialize Terraform:
```sh
 terraform init

4. Validate the Terraform configuration:
```sh
 terraform validate

5. Plan the changes to be made:
```sh
 terraform plan

6. Apply the configuration to create or update resources:
```sh
 terraform apply

7. To destroy the created resources when no longer needed:
```sh
 terraform destroy 

## Configuration

The main configuration files for this Terraform project are organized as follows:

1. `vpc.tf`: Defines the Virtual Private Cloud (VPC) resource.
2. `ec2.tf`: Defines the Elastic Compute Cloud (EC2) instances resource.
3. `sg.tf`: Defines Security Group (SG) resources.
4. `provider.tf`: Configures the AWS provider.
5. `variables.tf`: Declares input variables.
6. `local.tf`: Optionally, you can include a `local.tf` file to define local values or computations that can be used within your configuration.

Please review these files to understand and customize your infrastructure.

## Variables

This project uses variables to customize your infrastructure. You can specify them in a terraform.tfvars file or use environment variables. Refer to the `variables.tf` file for a list of available variables and their descriptions.

Here's a basic terraform.tfvars file:
```sh
region = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
instance_type = "t2.micro"
key_name = "your-key"
# Add more variables as needed

## Locals

The `local.tf` file defines local values and computed expressions for use within the Terraform configuration. Review this file to see how these values are used and customized.
## Terraform Commands

These commands are used to deploy this project; 

1. terraform init: Initializes the project.
2. terraform validate: Checks for syntax error.
3. terraform plan: Shows a preview of changes.
4. terraform apply: Applies the changes to create or update resources.
5. terraform destroy: Destroys all resources created by Terraform.


## Terraform Workspace

Terraform workspaces allow you to manage multiple environments or deployments within the same configuration. By creating separate workspaces, you can maintain different states and configurations for development, staging, and production environments.

Here are some common Terraform workspace commands:

- Initialize a new workspace:
  ```sh
  terraform workspace new <workspace_name>
- List all available workspaces:
  ```sh
  terraform workspace list
- Switch to a different workspace:
  ```sh
  terraform workspace select <workspace_name>
- Delete available workspaces:
  ```sh
  terraform workspace delete <workspace_name>
- Shows the name of your present workspaces:
  ```sh
  terraform workspace show

Create, update, or destroy resources within the selected workspace using other Terraform commands (e.g., terraform plan, terraform apply, terraform destroy).

Terraform workspaces can help you manage and isolate your infrastructure configurations for different environments, making it easier to collaborate and maintain consistency across your deployments.
## Contributing

Contributions are always welcome!
If you would like to contribute to this project or have suggestions for improvements, please open an issue or a pull request.


## Appendix


This README provides an introduction to the project, explains its structure, outlines prerequisites, and offers guidance on getting started, customization, and contributing. Make sure to replace placeholders with your actual project details and adjust the structure to match your project's needs.


