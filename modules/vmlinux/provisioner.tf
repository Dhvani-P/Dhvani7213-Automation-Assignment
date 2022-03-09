resource "null_resource" "linux_provisioner" {
  for_each = var.linux-name
  depends_on = [
    azurerm_linux_virtual_machine.linux_machine
  ]

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file("${var.private_key}")
      host        = azurerm_linux_virtual_machine.linux_machine[each.key].public_ip_address
    }

  }

}

