variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the storage account will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
}

variable "private_endpoint_subnet_id" {
  description = "Subnet ID used for the private endpoint"
  type        = string
}