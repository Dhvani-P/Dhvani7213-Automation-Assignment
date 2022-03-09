output "w_public_ip_address" {
  value = azurerm_windows_virtual_machine.windows_machine.public_ip_address
}

output "w_private_ip_address" {
  value = azurerm_windows_virtual_machine.windows_machine.private_ip_address
}

output "w_hostname" {
  value = azurerm_windows_virtual_machine.windows_machine.computer_name
}

output "w_avset_Name" {
  value = azurerm_availability_set.availability_set.name
}

output "Windows_VM_Id" {
  value = azurerm_windows_virtual_machine.windows_machine.id
}

output "Windows_vm_nic" {
  value = azurerm_network_interface.windows_nic
}

