# Azure GUIDS
variable "tenant_id" {
  type = string
  description = "Azure Tenant ID"
}
variable "client_id" {
  type = string
  description = "Azure Application ID"
}
variable "client_secret" {
  type = string
  sensitive = true
  description = "Azure Application Secret"
}
variable "subscription_id" {
  type = string
  description = "Azure Subscription ID"
}

variable "tag_list"{
  type   = list(string)
  description = "List of Mandatory tags"
}
