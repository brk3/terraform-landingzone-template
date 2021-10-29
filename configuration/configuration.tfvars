# NOTE(pbourke): typically this will be a nested structure where one can deploy multiple vnets, each
# with their own settings. Here we're avoiding that to keep things more simple for learning
# purposes.
settings = {
  vnet_name = "paul-vnet"
  address_space = ["10.0.0.0/16"]

  resource_group_key = "level1"
  lz_key = "launchpad"
}
