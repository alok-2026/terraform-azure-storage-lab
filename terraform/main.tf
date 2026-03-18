terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "tfstatealokbackend"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Network Module
module "network" {
  source = "../modules/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  vnet_name      = var.vnet_name
  address_space  = var.address_space
  subnet_name    = var.subnet_name
  subnet_prefix  = var.subnet_prefix
}

# Storage Account Module
module "storage_account" {
  source = "../modules/storage-account"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  storage_account_name       = var.storage_account_name
  container_name             = var.container_name
  private_endpoint_subnet_id = module.network.subnet_id
}