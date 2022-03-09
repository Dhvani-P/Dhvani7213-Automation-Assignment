output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_id" {
  description = "Id of the created subnet"
  value       = azurerm_subnet.subnet.id
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "subnet_address_space" {
  value = azurerm_subnet.subnet.address_prefixes
}

