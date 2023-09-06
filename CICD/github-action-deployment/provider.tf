terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  client_id       = "8e8af3c0"
  client_secret   = "kaa8Q"
  tenant_id       = "e6c246f2"
  subscription_id = "71769e04"
 }