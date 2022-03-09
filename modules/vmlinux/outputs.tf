output "public_ip_address" {
  value = values(azurerm_linux_virtual_machine.linux_machine)[*].public_ip_address
}

output "private_ip_address" {
  value = values(azurerm_linux_virtual_machine.linux_machine)[*].private_ip_address
}

output "linux_vm_hostname" {
  value = values(azurerm_linux_virtual_machine.linux_machine)[*].name
}

output "linux_nic" {
  value = values(azurerm_network_interface.linux_nic)[*]
}

output "linux_vm_id" {
  value = values(azurerm_linux_virtual_machine.linux_machine)[*].id
}
