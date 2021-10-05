# Used to access the configuration of the AzureRM provider
data "azurerm_client_config" "current" {}

# Used to Retrieve root module output values from each state passed in var.landingzone
data "terraform_remote_state" "remote" {
  for_each = try(var.landingzone.tfstates, {})

  backend = var.landingzone.backend_type
  config = local.remote_state[
  try(each.value.backend_type, var.landingzone.backend_type, "azurerm")][each.key]
}

