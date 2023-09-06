variable "name" {
  description = "The name of the key vault."
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID for the KeyVault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location where resources are created."
  type        = string
}