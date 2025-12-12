inputs = {
  project_id = "padok-lab"
  cluster_name_suffix = "karmada-test"
  region = "europe-west9"

  network = dependency.vpc.outputs.network_name
  subnetwork = dependency.vpc.outputs.subnets_names[0]

  ip_range_pods     = "pods"
  ip_range_services = "services"

  service_account = "default"
}
