###main terraform configuration file
terraform {
  required_version = ">= 1.10 "
}
terraform {
  backend "s3" {
    bucket = "odin-tfstate-8.1.25"
    key    = "tfstate/fsteps/terraform.tfstate"
    use_lockfile = true
    region     = "eu-west-2"
    profile    = "odinux"
  }
}
###the providers we use in our terraform code
provider "aws" {
  region     = var.region
  profile    = var.profile
}
