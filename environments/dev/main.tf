module "network" {
  source              = "../../modules/network"
  vnet_name           = "dev-vnet"
  location            = "Central India"
  resource_group_name = "rg-devops-storage-lab"
}