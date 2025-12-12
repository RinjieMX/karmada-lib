terraform {
  source = "${get_repo_root()}/modules/network"
}

include "root" {
  path           = find_in_parent_folders("root.hcl")
  merge_strategy = "deep"
}

include "inputs" {
  path           = "inputs.hcl"
  merge_strategy = "deep"
}
