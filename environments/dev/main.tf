module "network" {
  source = "../../modules/network"

  vnet_name           = "dev-vnet"
  resource_group_name = "rg-devops-storage-lab"
  location            = "Central India"

  subnet_name   = "dev-subnet"
  address_space = ["10.0.0.0/16"]
  subnet_prefix = ["10.0.1.0/24"]
}

module "storage_account" {
  source = "../../modules/storage-account"

  storage_account_name = "alokdevstorage123"
  resource_group_name  = "rg-devops-storage-lab"
  location             = "Central India"

  container_name = "dev-container"
}