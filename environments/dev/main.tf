module "network" {
  source = "../../modules/network"

  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location

  subnet_name   = "subnet-app"
  address_space = ["10.0.0.0/16"]
  subnet_prefix = ["10.0.1.0/24"]
}

module "storage_account" {
  source = "../../modules/storage-account"

  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  container_name       = var.container_name

  private_endpoint_subnet_id = module.network.subnet_private_endpoint_id
}

module "key_vault" {
  source = "../../modules/key-vault"

  key_vault_name      = "alokdev-keyvault"
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = var.tenant_id
  object_id = var.object_id
}