# locals {
#   ## --------------------------------------------------------------------------------------------------------
#   ## Storage Accounts
#   ## --------------------------------------------------------------------------------------------------------

#   ressourcegroup           = "terraformexamples-rg"
#   location                 = "centralus"
#   storageaccount           = "terraformexamples001"
#   storageaccountcollection = ["terraformexamples002", "terraformexamples003"]

# }


# ## terraform import azurerm_resource_group.rg /subscriptions/db50385e-4701-4aae-b499-4915d59caeaa/resourceGroups/terraformexamples-rg
# resource "azurerm_resource_group" "rg" {
#   name     = local.ressourcegroup
#   location = local.location
# }

# ## terraform import azurerm_storage_account.storageaccount /subscriptions/db50385e-4701-4aae-b499-4915d59caeaa/resourceGroups/terraformexamples-rg/providers/Microsoft.Storage/storageAccounts/terraformexamples001
# resource "azurerm_storage_account" "storageaccount" {
#   name                       = lower(local.storageaccount)
#   resource_group_name        = azurerm_resource_group.rg.name
#   location                   = azurerm_resource_group.rg.location
#   account_kind               = "StorageV2"
#   account_tier               = "Standard"
#   account_replication_type   = "LRS"
#   access_tier                = "Hot"
#   https_traffic_only_enabled = true
#   min_tls_version            = "TLS1_2"

# }

# ## terraform import azurerm_storage_account.storageaccountcollection[`"terraformexamples002`"] /subscriptions/db50385e-4701-4aae-b499-4915d59caeaa/resourceGroups/terraformexamples-rg/providers/Microsoft.Storage/storageAccounts/terraformexamples002
# ## terraform import azurerm_storage_account.storageaccountcollection[`"terraformexamples003`"] /subscriptions/db50385e-4701-4aae-b499-4915d59caeaa/resourceGroups/terraformexamples-rg/providers/Microsoft.Storage/storageAccounts/terraformexamples003
# resource "azurerm_storage_account" "storageaccountcollection" {
#   for_each = toset(local.storageaccountcollection)

#   name                       = lower(each.value)
#   resource_group_name        = azurerm_resource_group.rg.name
#   location                   = azurerm_resource_group.rg.location
#   account_kind               = "StorageV2"
#   account_tier               = "Standard"
#   account_replication_type   = "LRS"
#   access_tier                = "Hot"
#   https_traffic_only_enabled = true
#   min_tls_version            = "TLS1_2"

# }
