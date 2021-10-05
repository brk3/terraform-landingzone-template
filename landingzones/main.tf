terraform {
  required_providers {
    # Auth configuration is supplied by rover via environment variables
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}
