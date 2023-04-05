# Terraform Azure Tagging Policy Module

This module creates an Azure Policy Definition and Assignment to enforce required tags on Azure resources.

## Usage

module "azure_policy_definition" {
  source        = "path/to/module"
  tag_list      = ["Environment", "Department"]
  subscription  = "subscription=b1db2d61-6edf-4e6f-b42f-286904728d93"
}



## Inputs

| Name              | Description                                                                      | Type   | Default | Required |
|-------------------|----------------------------------------------------------------------------------|--------|---------|----------|
| tag_list          | List of tags that the user must add when creating a Resource Group               | list   | n/a     | yes      |
| subscription      | A subscription to apply the policy                                               | string | n/a     | yes      |


## Example 

terraform plan -var 'tag_list=["Environment","Application","Owner","Business Unit"]' -var 'subscription=b1db2d61-6edf-4e6f-b42f-286904728d93'

Sign in using az login from Powershell is required to run the main.tf 

