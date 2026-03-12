terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-devops-storage-lab"
    storage_account_name = "alokterraformstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
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

# Deploy Network Module
module "network" {
  source = "../modules/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

# Deploy Storage Account Module
module "storage_account" {
  source = "../modules/storage-account"

  resource_group_name  = azurerm_resource_group.rg.name
  location             = var.location
  storage_account_name = var.storage_account_name
}