resource "azurerm_resource_group" "main" {
  name     = "production-rg"
  location = "eastus2"
}
#  Tells Terraform to use local module
module "network" {
  source = "./modules/vnet"

  # 
  resource_group_name   = azurerm_resource_group.main.name
  location              = "eastus2"
  vnet_name             = "enterprise-vnet"
  address_space         = ["10.0.0.0/16"]
  public_subnet_prefix  = ["10.0.1.0/24"]
  private_subnet_prefix = ["10.0.2.0/24"]
}