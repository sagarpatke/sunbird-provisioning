resource "azurerm_resource_group" "sunbird" {
  name = "${var.implementation_name}-resource-group"
  location = "southindia"
}

resource "azurerm_storage_account" "sunbird" {
  name = "${var.implementation_name}${var.sunbird_environment}storage"
  resource_group_name = "${azurerm_resource_group.sunbird.name}"
  location = "southindia"
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sunbird" {
  name = "${var.implementation_name}storagecontainer"
  resource_group_name = "${azurerm_resource_group.sunbird.name}"
  storage_account_name = "${azurerm_storage_account.sunbird.name}"
  container_access_type = "private"
}

resource "azurerm_storage_blob" "sunbird" {
  name = "sunbird-storage"

  resource_group_name = "${azurerm_resource_group.sunbird.name}"
  storage_account_name = "${azurerm_storage_account.sunbird.name}"
  storage_container_name = "${azurerm_storage_container.sunbird.name}"
  type = "block"
}
