terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-devops-storage-lab"
    storage_account_name = "alokdevstorage123"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

module "network" {
  source = "../../modules/network"

  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
}

module "storage_account" {
  source = "../../modules/storage-account"

  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
}