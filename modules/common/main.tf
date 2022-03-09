resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.workspace_sku
  retention_in_days   = 30
  tags = var.tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.replication_type
  tags = var.tags
}


resource "azurerm_storage_container" "storage_container" {
  name                  = "content-7213"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}


resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_service_vault_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
  soft_delete_enabled = false
  tags = var.tags
}
