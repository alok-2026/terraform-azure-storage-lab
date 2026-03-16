module "network" {
  source = "../../modules/network"

  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name

  address_space = ["10.0.0.0/16"]

  subnet_name   = "subnet-app"
  subnet_prefix = ["10.0.1.0/24"]
}

module "storage_account" {
  source = "../../modules/storage-account"

  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  container_name       = var.container_name

  private_endpoint_subnet_id = module.network.subnet_private_endpoint_id
}

module "keyvault" {
  source = "../../modules/keyvault"

  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  object_id           = var.object_id
}