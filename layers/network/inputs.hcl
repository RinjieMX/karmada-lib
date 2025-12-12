locals {
  suffix = "karmada-manong"
  region = "europe-west9"
}

inputs = {
  project_id = "padok-lab"

  network_name = local.suffix
  shared_vpc_host = true

  subnets = [
    {
      subnet_name           = "${local.suffix}-1"
      subnet_ip             = "10.128.1.0/24"
      subnet_region         = local.region
      subnet_private_access = "true"
    },
    {
      subnet_name           = "${local.suffix}-2"
      subnet_ip             = "10.128.2.0/24"
      subnet_region         = local.region
      subnet_private_access = "true"
    },
    {
      subnet_name           = "${local.suffix}-3"
      subnet_ip             = "10.128.3.0/24"
      subnet_region         = local.region
      subnet_private_access = "true"
    }
  ]

  secondary_ranges = {
    "${local.suffix}-1" = [
      {
        range_name    = "pods"
        ip_cidr_range = "10.140.0.0/16"
      },
      {
        range_name    = "services"
        ip_cidr_range = "10.150.0.0/20"
      }
    ]
    "${local.suffix}-2" = []
    "${local.suffix}-3" = []
  }
}
