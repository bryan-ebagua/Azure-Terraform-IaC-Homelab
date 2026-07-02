variable "resource_group_name" {
    type = string
    description = "The name of the resource group the VNet belongs to."    
}

variable "location" {
    type = string
    description = "The Azure region the resources will be deployed in."
}

variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network."
}

variable "address_space" {
  type        = list(string)
  description = "The IP address and subnet mask for the virtual network, represented in CIDR notation"
}

variable "public_subnet_prefix" {
  type        = list(string)
  description = "The CIDR block for the public subnet."
}

variable "private_subnet_prefix" {
  type        = list(string)
  description = "The CIDR block for the private subnet."
}