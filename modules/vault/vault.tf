resource "azurerm_resource_group" "example" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_key_vault" "example" {
  name                = var.name
  tenant_id      = "${var.tenant_id}"
  resource_group_name   = "${var.resource_group_name}"
  location = "${var.location}"
  sku_name = "standard"
}


output "key_vault_id" {
  value = azurerm_key_vault.example.id
}