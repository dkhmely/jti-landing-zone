# resource "azurerm_key_vault" "key_vault" {
#   name                        = "${var.application}-${var.env}-kv"
#   location                    = azurerm_resource_group.rg.location
#   resource_group_name         = azurerm_resource_group.rg.name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false
#   enable_rbac_authorization   = true

#   sku_name = "standard"
# }

# resource "azurerm_key_vault_secret" "secret" {
#   name         = "${var.application}-${var.env}-sp"
#   value        = azuread_application_password.lz_app_password.value
#   key_vault_id = azurerm_key_vault.key_vault.id

#   depends_on = [azurerm_key_vault.key_vault, azuread_application_password.lz_app_password]
# }