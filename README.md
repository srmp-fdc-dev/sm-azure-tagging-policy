# Terraform Azure Anti-Fraud Policy Module

This Terraform code deploys an Azure policy definition and assignment to enforce tagging while creating a Resource Group.
This policy will be assigned to a specific Azure subscription.

## Usage

1. Install Terraform (version 0.13 or later) and configure your Azure credentials.
2. Clone this repository and navigate to the root directory.
3. Run terraform init to initialize the provider and modules.
4. Customize the variables in variables.tf as needed.
5. Run terraform apply to create or update the Azure resources.


## Inputs

| Name              | Description                                                          | Type   | Default                                                           | Required |
|-------------------|----------------------------------------------------------------------|--------|-------------------------------------------------------------------|----------|
| policy_name       | Name of the policy definition                                        | string | "tagging-policy"                                               | yes      |
| scope             | Subscription, where you want to apply the policy                     | string | n/a                                                              | yes      |
| display_name      | Display name of the policy definition                                | string | "Tagging Policy"                                               | yes      |
| description       | Description of the policy definition                                 | string | "This policy prevents anyone to create resource groups without tags." | yes      |
| policy_mode       | Mode of the policy definition                                        | string | "All"                                                             | yes      |
| Subscription      | Subscription that the policy is going to be applied                  | string | n/a                                                              | yes      |


## Example

terraform plan -var 'scope="/subscriptions/****************************"'
terraform apply -var 'scope="/subscriptions/*****************************"'
terraform destroy -var 'scope="/subscriptions/******************************"'


