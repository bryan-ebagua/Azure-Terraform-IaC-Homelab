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
  
#Network Security Group
resource "azurerm_network_security_group" "public" {
    name = "public-nsg"
    location = var.location
    resource_group_name = var.resource_group_name

    # Allow List
    security_rule {
        name                       = "Allow-HTTP-Inbound"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "Internet"
        destination_address_prefix = "*"
  }
}

# Assigns the Security Group to the subnet
resource "azurerm_subnet_network_security_group_association" "public_assoc" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.public.id
}
  