variable "rg_name" {}

variable "location" {}
variable "vnet" {
  default = "network-vnet"
}

variable "vnet_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  default = "network-subnet1"
}

variable "subnet_space" {
  default = ["10.0.1.0/24"]

}
variable "nsg" {
  default = "network-nsg01"
}

variable "tags" {
   type = map
   default = {
   project = "Automation Project - Assignment 1"
   Name    = "Dhvani.Pandya"
   ExpirationDate  = "2022-03-08"
   Environment       = "Lab"
}
}
