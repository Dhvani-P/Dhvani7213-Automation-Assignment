variable "recovery_service_vault_name" {

}

variable "log_analytics_workspace_name" {
  
}

variable "storage_account_name" {
  
}

variable "location" {

}

variable "rg_name" {
  
}

variable "workspace_sku" {
	default = "PerGB2018"
}

variable "replication_type" {
	default = "LRS"
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

