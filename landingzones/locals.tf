# Our 'data.terraform_remote_state.remote' data source requires configuration. This is built from
# the following sources:
#
# * Info discovered and supplied by rover (local.landingzone.current, local.landingzone.lower)
# * Info supplied by user in tfvars (var.landingzone.tfstates)
# * Variables passed directly to this module (e.g. var.tfstate_subscription_id is used if none was
#   specified in local.landingzone.tfstates for a particular state)

locals {
  landingzone = {
    current = {
      storage_account_name = var.tfstate_storage_account_name
      container_name       = var.tfstate_container_name
      resource_group_name  = var.tfstate_resource_group_name
    }
    lower = {
      storage_account_name = var.lower_storage_account_name
      container_name       = var.lower_container_name
      resource_group_name  = var.lower_resource_group_name
    }
  }

  remote_state = {
    azurerm = {
      for key, value in try(var.landingzone.tfstates, {}) : key => {
        container_name       = try(value.workspace, local.landingzone[try(value.level, "current")].container_name)
        key                  = value.tfstate
        resource_group_name  = try(value.resource_group_name, local.landingzone[try(value.level, "current")].resource_group_name)
        storage_account_name = try(value.storage_account_name, local.landingzone[try(value.level, "current")].storage_account_name)
        subscription_id      = try(value.subscription_id, var.tfstate_subscription_id)
        tenant_id            = try(value.tenant_id, data.azurerm_client_config.current.tenant_id)
        sas_token            = try(value.sas_token, null) != null ? var.sas_token : null
      }
    }
  }

  # At least one state (identified by global_settings_key) in any level should output a
  # global_settings object. Check for the various locations this can be found and merge together
  # with any global_settings defined by this module.
  global_settings = merge(
    var.global_settings,
    try(data.terraform_remote_state.remote[var.landingzone.global_settings_key].outputs.objects[var.landingzone.global_settings_key].global_settings, null),
    try(data.terraform_remote_state.remote[var.landingzone.global_settings_key].outputs.global_settings, null),
    try(data.terraform_remote_state.remote[keys(var.landingzone.tfstates)[0]].outputs.global_settings, null)
  )
}
