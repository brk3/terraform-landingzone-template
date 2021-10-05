landingzone = {
  # Backend that will be used to store module state
  backend_type = "azurerm"

  # Key for which object to select from tfstates below to access the global_settings defined within
  # that state
  global_settings_key = "launchpad"

  # The level this module is being deployed under
  level = "level1"

  # ?
  key = "foundations"

  # States that this module requires output from
  tfstates = {
    launchpad = {
      level   = "lower"
      tfstate = "caf_launchpad.tfstate"
    }
  }
}
