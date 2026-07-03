
variable "location" {

  description = "Azure region"

  type        = string

  default     = "East US"

}



variable "resource_group_name" {

  description = "Name of the resource group"

  type        = string

  default     = "rg-web-infrastructure"

}



variable "vm_count" {

  description = "Number of web server VMs"

  type        = number

  default     = 2

}



variable "vm_size" {

  description = "Size of each VM"

  type        = string

  default     = "Standard_DC1s_v3"

}



variable "admin_username" {

  description = "Admin username for VMs"

  type        = string

  default     = "azureuser"

}



variable "ssh_public_key" {

  description = "SSH public key for VM access"

  type        = string

}



variable "project_name" {

  description = "Project name used for resource naming"

  type        = string

  default     = "webinfra"

}

