terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
      version = "=1.2.6"
    }
  }
  required_version = ">= 0.13"
}

# Auth configuration is supplied by rover via environment variables
provider "azurerm" {
  features {}
}
