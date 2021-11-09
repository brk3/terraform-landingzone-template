resource "azurecaf_name" "caf_name_vnet" {
  name          = var.settings.vnet_name
  resource_type = "azurerm_virtual_network"
  prefixes      = local.global_settings.prefixes
  random_length = local.global_settings.random_length
  clean_input   = true
  passthrough   = local.global_settings.passthrough
  use_slug      = local.global_settings.use_slug
}

# Creates a vnet using the settings passed along with a remote resource group, and the region coming
# from global_settings
resource "azurerm_virtual_network" "example" {
  name                = azurecaf_name.caf_name_vnet.result
  resource_group_name = local.remote.resource_groups[var.settings.lz_key][var.settings.resource_group_key].name
  location            = local.global_settings.regions[local.global_settings.default_region]
  address_space       = var.settings.address_space
}
