module "storage_account" {

  source = "../../modules/storage-account"

  resource_group_name  = "rg-devops-storage-lab"
  location             = "Central India"
  storage_account_name = "alokdevstorage123"
  container_name       = "devcontainer"

}