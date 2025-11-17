#variable "subscription_id" { type = string }
variable "location" { type = string, default = "eastus" }
variable "rg_name" { type = string, default = "rg-aks-prod" }
variable "vnet_name" { type = string, default = "vnet-aks-prod" }
variable "aks_name" { type = string, default = "aks-prod-cluster" }
variable "acr_name" { type = string }
variable "backend_rg" { type = string }
variable "backend_sa" { type = string }
variable "backend_container" { type = string }
