module "gcp-network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 13.0"

  project_id   = var.project_id
  network_name = var.network_name
  routing_mode = "REGIONAL"

  subnets          = var.subnets
  secondary_ranges = var.secondary_ranges

  bgp_best_path_selection_mode = "STANDARD"
  bgp_always_compare_med      = false
}
