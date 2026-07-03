
variable "vm_count" {

  description = "Number of VMs to create"

  type = number

}



variable "vm_size" {

  description = "Size of each VM"

  type = string

}



variable "location" {

  description = "Azure region"

  type = string

}



variable "resource_group_name" {

  description = "Resource group name"

  type = string

}



variable "subnet_id" {

  description = "Subnet ID to attach NICs to"

  type = string

}



variable "admin_username" {

  description = "Admin username"

  type = string

}



variable "ssh_public_key" {

  description = "SSH public key"

  type = string

}



variable "project_name" {

  description = "Project name for resource naming"

  type = string

}

