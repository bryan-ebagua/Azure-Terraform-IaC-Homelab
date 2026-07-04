output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.main.id
}

output "private_ip" {
  description = "The private IP address of the web server"
  value       = azurerm_network_interface.main.private_ip_address
}