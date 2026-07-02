# Creating the VNet
resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  location = var.location
  resource_group_name = var.resource_group_name
  address_space = var.address_space
}

# Public Subnet
resource "azurerm_subnet" "public" {
    name = "public-subnet"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.public_subnet_prefix
}

# Private subnet
resource "azurerm_subnet" "private" {
    name = "private-subnet"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.private_subnet_prefix
}
  

  