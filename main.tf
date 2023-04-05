terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.50.0"
    }
  }
}

provider "azurerm" {
  features {}

  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
}

resource "azurerm_policy_definition" "addTagToRG" {
  count        = "${length(var.tag_list)}"
  name         = "addTagToRG-${var.tag_list[count.index]}"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "${var.tag_list[count.index]} Tag to resource group"
  description  = "This policy will make it mandatory for the user to add specified tags whenever creating a Resource Group."
  metadata = <<METADATA
    {
    "category": "General",
    "version" : "1.0.0"
    }
  METADATA
  policy_rule = <<POLICY_RULE
  {
      "if": {
        "allof": [
          {
            "field": "[concat('tags[', parameters('tagName'), ']')]",
            "exists": "false"
          },
          {
            "field": "type",
            "equals": "Microsoft.Resources/subscriptions/resourceGroups"
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
  POLICY_RULE
parameters = <<PARAMETERS
    {
        "tagName": {
          "type": "String",
          "metadata": {
            "displayName": "Mandatory Tag ${var.tag_list[count.index]}",
            "description": "Name of the tag, such as ${var.tag_list[count.index]}"
          },
          "defaultValue": "${var.tag_list[count.index]}"
        }
}
PARAMETERS
}

data "azurerm_subscription" "current" {}

