
variable "rg_name" {}

variable "linux-name" {
}
variable "linux_vm_id" {}
variable "location" {}
variable "subnet_id" {}
variable "linux_avset" {}

variable "size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "dnp1194"
}

variable "public_key" {
  default = "/home/dnp1194/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "/home/dnp1194/.ssh/id_rsa"
}

variable "storage_accountType" {
  default = "Premium_LRS"
}

variable "disk_size" {
  default = "32"
}

variable "caching" {
  default = "ReadWrite"
}

variable "publisher" {
  default = "Canonical"
}

variable "offer" {
  default = "UbuntuServer"
}

variable "sku" {
  default = "19.04"
}

variable "OS_version" {
  default = "latest"
}

variable "availability_set" {
  default = "linux_avs"
}

variable "tags"{
type = map
default = {
   project = "Automation Project - Assignment 1"
   Name    = "Dhvani.Pandya"
   ExpirationDate  = "2022-03-08"
   Environment       = "Lab"
 }
}

