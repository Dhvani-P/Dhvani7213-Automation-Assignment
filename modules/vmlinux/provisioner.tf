resource "null_resource" "linux_provisioner" {
  for_each = var.linux-name
  depends_on = [
    azurerm_linux_virtual_machine.linux_machine , azurerm_virtual_machine_data_disk_attachment.linux_attachment
  ]

  provisioner "local-exec" {
    command = "sleep 20; ansible-playbook groupX-playbook.yaml"
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file("${var.private_key}")
      host        = azurerm_linux_virtual_machine.linux_machine[each.key].public_ip_address
    }

  }

}

