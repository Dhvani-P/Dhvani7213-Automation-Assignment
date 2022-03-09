
variable "rg_name" {}
variable "location" {}
variable "subnet_id" {}

variable "windows_avs" {
  default = "windows_avs"
}

variable "windows_name" {
  
}

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}

variable "windows_sku" {
  default = "2016-Datacenter"
}

variable "windows_version" {
  default = "latest"
}

variable "windows_os_disk_attr" {
  type = map(string)
  default = {
    storage_account_type = "StandardSSD_LRS"
    disk_size            = "127"
    disk_caching         = "ReadWrite"
  }
}

 variable "tags" {
  type = map
default = {
    Name         = "Dhvani Pandya"
    Project      = "Automation Project – Assignment 1"
    ExpirationDate = "2022-03-08"
    ContactEmail = "dnp1194@gmail.com"
    Environment  = "Lab"
  }
}


variable "size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "dnp1194"
}

variable "admin_password" {
  default = "P@$$w0rd1234!"
}

variable "public_key" {
  default = "/home/dnp1194/.ssh/id_rsa.pub"
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

