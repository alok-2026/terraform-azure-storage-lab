output "subnet_private_endpoint_id" {
  description = "Private endpoint subnet ID"
  value       = azurerm_subnet.subnet_private_endpoint.id
}