resource "azurerm_network_interface" "main" {
  name                = "web-server-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = "web-server-vm"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  disable_password_authentication = false

  # The Network Card
  network_interface_ids = [azurerm_network_interface.main.id]

  # 
  size           = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password

  # VM Hard Drive (OS Disk)
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  #  VM Operating System (Ubuntu Linux)
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}