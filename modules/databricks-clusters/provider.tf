terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

 provider "databricks" {
  azure_workspace_resource_id = azurerm_databricks_workspace.myworkspace.id
  azure_client_id       = "db0dc791"
  azure_client_secret   = "MCE8Q~qEsgT6rTX"
  azure_tenant_id       = "84f1e4ea"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  client_id       = "db0dc791"
  client_secret   = "MCE8Q~qEsgT6rTX"
  tenant_id       = "84f1e4ea"
  subscription_id = "2213e8b1"
 }
 
