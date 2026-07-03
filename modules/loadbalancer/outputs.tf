
output "public_ip" {

  description = "Public IP address of the load balancer"

  value       = azurerm_public_ip.lb.ip_address

}



output "lb_id" {

  description = "Load balancer ID"

  value       = azurerm_lb.main.id

}

