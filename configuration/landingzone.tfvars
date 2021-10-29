# TODO:
# * Document how outputs should work
#   * Also look into / demonstrate combined objects
# * Document how tags should work
# * Document how prefix/naming should work

landingzone = {
  # Backend that will be used to store module state
  backend_type = "azurerm"

  # Key for which object to select from tfstates below to access the global_settings defined within
  # that state
  global_settings_key = "launchpad"

  # The level this module is being deployed under. From what I can tell this is added to all
  # resources created by this module. Unsure if it has any other purpose in the wider CAF patterns.
  level = "level1"

  # All objects output by this module are mapped under this key.
  # TODO: revisit this when discussing outputs.
  key = "foundations"

  # States that this module requires output from. level/tfstate are required, other info such as
  # resource_group, subscription, etc. can be specified but are generally left up to the module's
  # local.remote_state.azurerm logic to infer these values.
  tfstates = {
    launchpad = {
      level   = "lower"
      tfstate = "caf_launchpad.tfstate"
    }
  }
}
