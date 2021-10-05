# Sample resource creation, using the location from the lower levels' global setting
resource "azurerm_resource_group" "example" {
  name     = "paulrg"
  location = local.global_settings.regions[local.global_settings.default_region]
}
