
resource "azurerm_public_ip" "lb" {

  name = "pip-lb-${var.project_name}"

  location = var.location

  resource_group_name = var.resource_group_name

  allocation_method = "Static"

  sku = "Standard"

}



resource "azurerm_lb" "main" {

  name = "lb-${var.project_name}"

  location = var.location

  resource_group_name = var.resource_group_name

  sku = "Standard"



  frontend_ip_configuration {

    name = "frontend"

    public_ip_address_id = azurerm_public_ip.lb.id

  }

}



resource "azurerm_lb_backend_address_pool" "main" {

  name = "backend-pool"

  loadbalancer_id = azurerm_lb.main.id

}



resource "azurerm_network_interface_backend_address_pool_association" "main" {

  count = length(var.vm_nic_ids)

  network_interface_id = var.vm_nic_ids[count.index]

  ip_configuration_name = "internal"

  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
}

resource "azurerm_lb_probe" "main" {
  name            = "http-probe"
  loadbalancer_id = azurerm_lb.main.id
  protocol        = "Http"
  port            = 80
  request_path    = "/"
}

resource "azurerm_lb_rule" "main" {
  name                           = "http-rule"
  loadbalancer_id                = azurerm_lb.main.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontend"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.main.id]
  probe_id                       = azurerm_lb_probe.main.id
}
