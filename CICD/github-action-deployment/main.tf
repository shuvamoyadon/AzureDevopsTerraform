# module "azure_databricks_demo" {
#   source       = "../../modules/databricks-clusters"
#   cluster_name = var.cluster_name
#   department   = var.department
#   user_names   = var.user_names
#   group_name   = var.group_name
#   resource_group_name = var.resource_group_name
#   location = var.location
#   tags         = var.tags
# }

module "azure_storage" {
  source                 = "../../modules/storage"
  storage_account_name   = var.storage_account_name
  location = var.location
  resource_group_name = var.resource_group_name
}

module "key_vault" {
  source              = "../../modules/vault"
  name                = var.name
  tenant_id           = var.tenant_id
  location = var.location
  resource_group_name = var.resource_group_name
}