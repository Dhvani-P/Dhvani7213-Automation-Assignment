
resource "azurerm_availability_set" "availability_set" {
  name                         = var.availability_set
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
}

resource "azurerm_public_ip" "linux_pip" {
  for_each            = var.linux-name
  name                = "${each.key}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"

   tags = var.tags

}

resource "azurerm_network_interface" "linux_nic" {
  for_each            = var.linux-name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name
  ip_configuration {
    name                          = "${each.key}-nic-ip"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.key].id
  }
   tags = var.tags

}

resource "azurerm_linux_virtual_machine" "linux_machine" {
  for_each              = var.linux-name
  name                  = each.key
  computer_name         = each.key
  resource_group_name   = var.rg_name
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_username
  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]
  availability_set_id   = azurerm_availability_set.availability_set.id

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("${var.public_key}")
  }

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_accountType
    disk_size_gb         = var.disk_size
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.OS_version
  }
  tags = var.tags

}

