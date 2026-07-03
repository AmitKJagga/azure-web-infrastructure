
terraform {

  required_providers {

    azurerm = {

      source = "hashicorp/azurerm"

      version = "~> 4.0"

    }

  }



  backend "azurerm" {

    resource_group_name = "rg-terraform-state"

    storage_account_name = "tfstatelab2026"

    container_name = "tfstate"

    key = "azure-web-infrastructure.tfstate"

  }

}



provider "azurerm" {

  features {}

  subscription_id = "71b31346-1819-4f4d-9f6b-e873cfeeaf04"

}



resource "azurerm_resource_group" "main" {

  name = var.resource_group_name

  location = var.location

}



resource "azurerm_virtual_network" "main" {

  name = "vnet-${var.project_name}"

  address_space = ["10.0.0.0/16"]

  location = azurerm_resource_group.main.location

  resource_group_name = azurerm_resource_group.main.name

}



resource "azurerm_subnet" "main" {

  name = "subnet-${var.project_name}"

  resource_group_name = azurerm_resource_group.main.name

  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "main" {
  name                = "nsg-${var.project_name}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = azurerm_subnet.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}

module "vms" {
  source              = "./modules/vm"
  vm_count            = var.vm_count
  vm_size             = var.vm_size
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_public_key
  project_name        = var.project_name
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  project_name        = var.project_name
  vm_nic_ids          = module.vms.nic_ids
}

output "load_balancer_ip" {
  value = module.loadbalancer.public_ip
}

output "vm_private_ips" {
  value = module.vms.private_ips
}
