
resource "azurerm_availability_set" "availability_set" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
}

resource "azurerm_public_ip" "windows_pip" {
  name = "win_pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_dns_zone" "windows-dns" {
  name                = "mywindowsdomain.com"
  resource_group_name = var.rg_name
}

resource "azurerm_dns_a_record" "windows-dns-record" {
  name                = "test"
  zone_name           = azurerm_dns_zone.windows-dns.name
  resource_group_name = var.rg_name
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.windows_pip.id
}

resource "azurerm_network_interface" "windows_nic" {
  name                = "windows-nic"
  location            = var.location
  resource_group_name = var.rg_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip.id
  }

  tags = var.tags

}

resource "azurerm_windows_virtual_machine" "windows_machine" {
  name            = var.windows_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [azurerm_network_interface.windows_nic.id]
  availability_set_id   = azurerm_availability_set.availability_set.id

  winrm_listener {
    protocol = "Http"
  }

  os_disk {
    name                 = "windows-osdisk"
    storage_account_type = var.windows_os_disk_attr["storage_account_type"]
    disk_size_gb         = var.windows_os_disk_attr["disk_size"]
    caching              = var.windows_os_disk_attr["disk_caching"]
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }
  tags = var.tags

}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "dpacc1194"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storagecontainer" {
  name                  = "dpcontainer"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}

resource "azurerm_virtual_machine_extension" "win-extension" {
  name                 = "hostname"
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_machine.id
  publisher                  = "Microsoft.Azure.Security"
    type                       = "IaaSAntimalware"
    type_handler_version       = "1.3"
    auto_upgrade_minor_version = "true"
  
    settings = <<SETTINGS
    {
      "AntimalwareEnabled": true,
      "RealtimeProtectionEnabled": "true",
      "ScheduledScanSettings": {
      "isEnabled": "true",
      "day": "1",
      "time": "120",
      "scanType": "Quick"
      },
      "Exclusions": {
      "Extensions": "",
      "Paths": "",
      "Processes": ""
      }
    }
  SETTINGS
 }


