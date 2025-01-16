data "terraform_remote_state" "first-steps" {
  backend = "s3"

  config = {
    bucket = "odin-tfstate-8.1.25"
    key    = "tfstate/fsteps/terraform.tfstate"
    region = "eu-west-2"
    profile = "odinux"
  }
}

locals {
  rstate = data.terraform_remote_state.first-steps.outputs
  vpc_id = data.terraform_remote_state.first-steps.outputs.vpc_id
}
output "vpc_id" {
  value = local.vpc_id
}
output "rstate" {
  value = local.rstate.vpc_id
}