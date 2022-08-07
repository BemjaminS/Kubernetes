

variable "azurerm_resource_group_name" {
  description = "this is the name of resource group"
  default     = "Weight-Tracker-k8s"
}

variable "location" {
  description = "Region to build into"
  default     = "westeurope"
}

variable "agent_count" {
    default = 2
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "k8s-app"
}

variable aks_service_principal_app_id {
  description = "aks_service_principal_app_id"
}

variable aks_service_principal_client_secret {
  description = "aks_service_principal_client_secret"
}
