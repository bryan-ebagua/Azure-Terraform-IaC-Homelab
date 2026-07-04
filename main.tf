resource "azurerm_resource_group" "main" {
  name     = "production-rg"
  location = "southcentralus"
}
#  Tells Terraform to use local module
module "network" {
  source = "./modules/vnet"

  # 
  resource_group_name   = azurerm_resource_group.main.name
  location              = "southcentralus"
  vnet_name             = "enterprise-vnet"
  address_space         = ["10.0.0.0/16"]
  public_subnet_prefix  = ["10.0.1.0/24"]
  private_subnet_prefix = ["10.0.2.0/24"]
}

module "compute" {
  source = "./modules/compute"

  # Standard Variables
  resource_group_name = azurerm_resource_group.main.name
  location            = "southcentralus"
  
  # VM Specific Variables
  vm_size        = "Standard_B1s"
  admin_username = "azureadmin"
  admin_password = "Password1234!" 

  #  Connects the VM to the Network Module
  subnet_id = module.network.public_subnet_id
}