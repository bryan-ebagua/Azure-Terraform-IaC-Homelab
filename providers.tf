terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.0"
      }
    }

    #remote state vault
    backend "azurerm" {
        resource_group_name = "tfstate-rg-2"
        storage_account_name = "tfstatebe33185"
        container_name = "tfstate"
        key = "terraform.tfstate" # The name of the state file
    }
}
provider "azurerm" {
  features {}
}