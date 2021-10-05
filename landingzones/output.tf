# Output our copy of global_settings to be used in the next level
output "global_settings" {
  value     = local.global_settings
  sensitive = true
}
