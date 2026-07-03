
variable "location" {

  description = "Azure region"

  type        = string

}



variable "resource_group_name" {

  description = "Resource group name"

  type        = string

}



variable "project_name" {

  description = "Project name for resource naming"

  type        = string

}



variable "vm_nic_ids" {

  description = "List of VM NIC IDs to attach to backend pool"

  type        = list(string)

}

