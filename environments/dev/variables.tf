variable "resource_group_name" {
  description = "Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "container_name" {
  description = "Storage container name"
  type        = string
}
variable "tenant_id" {}

variable "object_id" {}