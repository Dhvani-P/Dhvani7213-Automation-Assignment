output "rgroup" {
  value = module.rgroup.rg_name
}

output "location" {
  value = module.rgroup.location_name
}
output "vnet_name" {
  value = module.network.virtual_network_name
}

output "vnet_space" {
  value = module.network.address_space
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "subnet_space" {
  value = module.network.subnet_address_space
}
#linux

output "linux_vm_hostnames" {
  value = module.vmlinux.linux_vm_hostname
}

output "linux_private_ips" {
  value = module.vmlinux.private_ip_address
}

output "linux_public_ips" {
  value = module.vmlinux.public_ip_address
}

#windows
output "windows_avs_name" {
  value = module.vmwindows.w_avset_Name
}

output "windows_vm_hostnames" {
  value = module.vmwindows.w_hostname
}

output "windows_private_ips" {
  value = module.vmwindows.w_private_ip_address
}

output "windows_public_ips" {
  value = module.vmwindows.w_public_ip_address
}


# database 

output "Database_ServerName" {
  value = module.database.db_server_name
}

output "Database_Name" {
  value = module.database.db_name
}

#loadbalancer output

output "LoadBalancer_Name" {
  value = module.loadbalancer.load_balancer_name
}

# common 

output "recovery_vault_name" {
  value = module.common.recovery_vault_name
}

output "log_analytics_workspace" {
  value = module.common.log_analytics_workspace_name
}

output "storage_account_name" {
  value = module.common.storage_account_name
}
