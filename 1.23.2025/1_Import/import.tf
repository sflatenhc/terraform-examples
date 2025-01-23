# import {
#   to = azurerm_resource_group.rg 
#   id = "/subscriptions/db50385e-4701-4aae-b499-4915d59caeaa/resourceGroups/terraformexamples-rg"
# }

# import {
#   to = azurerm_storage_account.storageaccount 
#   id = "/subscriptions/db50385e-4701-4aae-b499-4915d59caeaa/resourceGroups/terraformexamples-rg/providers/Microsoft.Storage/storageAccounts/terraformexamples001"
# }

# import {
#   to = azurerm_storage_account.storageaccountcollection["terraformexamples002"] 
#   id = "/subscriptions/db50385e-4701-4aae-b499-4915d59caeaa/resourceGroups/terraformexamples-rg/providers/Microsoft.Storage/storageAccounts/terraformexamples002"
# }

import {
  for_each = toset(local.storageaccountcollection)

  to = azurerm_storage_account.storageaccountcollection[each.value] 
  id = "/subscriptions/db50385e-4701-4aae-b499-4915d59caeaa/resourceGroups/terraformexamples-rg/providers/Microsoft.Storage/storageAccounts/${each.value}"
}