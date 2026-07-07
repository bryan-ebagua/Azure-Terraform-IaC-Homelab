variable "resource_group_name" {
    type = string
    description = "The name of the resource group"
}

variable "vm_size" {
    type = string
    description = "The specs of the VM (RAM & CPU)"
}

variable "location" {
  type        = string
  description = "The Azure region for the VM."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the VM will live."
}

variable "admin_username" {
  type        = string
  description = "The username for the local administrator account."
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "The password for the local administrator account."
}