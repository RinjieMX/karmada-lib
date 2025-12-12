locals {
  project_id = "padok-lab"
  project_region = "europe-west9"

  state_bucket_name = "karmada-state"
}

# Configure Terragrunt to use GCS as remote state backend
remote_state {
  backend = "gcs"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    project  = local.project_id
    location = local.project_region
    bucket   = local.state_bucket_name
    prefix   = "${path_relative_to_include()}"
  }
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  user_project_override = true
  billing_project = "${local.project_id}"
  project               = "${local.project_id}"
  request_timeout       = "60s"
}

provider "google-beta" {
  user_project_override = true
  billing_project = "${local.project_id}"
  project               = "${local.project_id}"
  request_timeout       = "60s"
}
EOF
}
