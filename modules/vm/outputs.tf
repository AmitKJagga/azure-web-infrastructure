
output "nic_ids" {

  description = "Network interface IDs for load balancer backend pool"

  value       = azurerm_network_interface.vm[*].id

}



output "private_ips" {

  description = "Private IP addresses of all VMs"

  value       = azurerm_network_interface.vm[*].private_ip_address

}



output "public_ips" {

  description = "Public IP addresses of all VMs"

  value       = azurerm_public_ip.vm[*].ip_address

}



output "vm_names" {

  description = "Names of all VMs"

  value       = azurerm_linux_virtual_machine.vm[*].name

}

