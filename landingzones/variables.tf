# Vars specific to this module
variable "settings" {
  description = "Map of configuration settings for this module."
  default = {}
}

# CAF framework vars
variable "landingzone" {
  description = "Configuration info relating to this landingzone"
  default = {}
}

variable "global_settings" {
  description = "Configuration specific to this landingzone that should be exposed to the next level."
  default = {}
}

variable "tfstate_storage_account_name" {
  description = "Storage account name to use for the state backend. Supplied by Rover."
}

variable "tfstate_container_name" {
  description = "Container name to use within the storage account for the state backend. Supplied by Rover."
}

variable "tfstate_resource_group_name" {
  description = "Resource group where the state storage account is located. Supplied by Rover."
}

variable "lower_storage_account_name" {
  description = "Storage account name containing state from the lower level. Supplied by Rover."
}

variable "lower_container_name" {
  description = "Container name containing state from the lower level. Supplied by Rover."
}

variable "lower_resource_group_name" {
  description = "Resource group containing the lower level storage account. Supplied by Rover."
}

variable "tfstate_subscription_id" {
  description = "Subscription id containing the state storage accounts. Supplied by Rover."
}

variable "sas_token" {
  description = "Supply if accessing state storage using shared access tokens."
  default = null
}
